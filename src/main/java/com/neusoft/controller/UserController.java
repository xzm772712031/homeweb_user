package com.neusoft.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.neusoft.pojo.User;
import com.neusoft.service.UserService;

import sdk.GeetestLib;
import validate.GeetestConfig;

@Controller
public class UserController {
	@Autowired
	UserService userService;
    /**
     * 用户名查询（重名检测）
     * @param user
     * @return
     */
	@RequestMapping("/checkAccount")
	public @ResponseBody boolean checkAccount(User user) {
		user = userService.checkAccount(user);
		//判断用户是否存在
		if (user == null) {
			return false;
		} else {
			return true;
		}
	}
	
	
	@RequestMapping("/login2")
	public @ResponseBody User login2(User user) {
		user = userService.checkAccount(user);
	    return user;
	}
    /**
     * 用户注册
     * @param user
     * @param session
     * @return
     */
	@RequestMapping("/register")
	public @ResponseBody boolean register(User user, HttpSession session) {
		//用户注册时的初始状态
		user.setUserState(0);
		userService.register(user);
		user = userService.checkAccount(user);
		session.setAttribute("userId", user.getUserId());
		return true;
	}
	
    /**
     * 客户信息补全
     * @param user
     * @param session
     * @return
     * @throws IOException 
     */
	@RequestMapping("/registerAdd")
	public @ResponseBody boolean registerAdd(User user, HttpSession session) throws IOException {
		//获取Session中的用户编号
		int userId =0 ;
		User user2 = (User) session.getAttribute("user");
		if (null!=user2){
			userId = user2.getUserId();	
		}
		else{
		userId= (int) session.getAttribute("userId");
		}
		user.setUserId(userId);
		user.setUserState(1);
		userService.registerAdd(user);
		session.removeAttribute("userId");
		return true;
	}
	
	@RequestMapping("/updatePassword")
	public @ResponseBody Boolean updatePassword(User user,HttpSession session) {
		User user2 = (User) session.getAttribute("user");
		int userId = user2.getUserId();
		user.setUserId(userId);
		int count = userService.updatepassword(user);
		if(count!=0){
			session.removeAttribute("user");	
			return true;
		}
		else{
		return false;
		}
	}
	
	@RequestMapping("/updatePassword2")
	public @ResponseBody Boolean updatePassword2(User user,HttpSession session) {
		int userId = (int) session.getAttribute("flag");
		user.setUserId(userId);
		int count = userService.updateUser(user);
		if(count!=0){
			session.removeAttribute("user");
			return true;
		}
		else{
		return false;
		}
	}
	
	@RequestMapping("/updateUser")
	public @ResponseBody String  updateUser(User user,HttpSession session) {
		int userId = (int) session.getAttribute("flag");
		System.out.println(userId);
		user.setUserId(userId);
		int count = userService.updateUser(user);
		if(count!=0){
			return "修改成功";
		}
		else{
		return "修改失败";
		}
	}
	
	@RequestMapping("/showupdateUser")
	public  String  showupdate(int userId,Model model) {
		model.addAttribute("user", userService.SearchUserById(userId));
		return "UpdateUser";
		
	}
	/**
	 * 用户登录，引入极验
	 * 
	 * @param request
	 * @param response
	 * @param user
	 * @throws IOException
	 */
	@RequestMapping("/login")
	@ResponseBody
	public void verifyCaptchaCode(HttpServletRequest request, HttpServletResponse response, User user)
			throws IOException {
		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
				GeetestConfig.isnewfailback());
		user = userService.login(user);
		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
		// 从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);

		// 从session中获取userid
		String user_id = (String) request.getSession().getAttribute("userid");

		int gtResult = 0;

		if (gt_server_status_code == 1) {

			// gt-server正常，向gt-server进行二次验证
			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, user_id);
			System.out.println(gtResult);
		} else {
			// gt-server非正常情况下，进行failback模式验证

			System.out.println("failback:use your own server captcha validate");
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
			System.out.println(gtResult);
		}

		if (gtResult == 1 && user != null) {
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("flag", user.getUserId());
			// 验证成功
			PrintWriter out = response.getWriter();
			JSONObject data = new JSONObject();
			try {
				data.put("status", "success");
				data.put("version", gtSdk.getVersionInfo());

			} catch (JSONException e) {
				e.printStackTrace();
			}
			out.println(data.toString());
		} else {
			// 验证失败
			JSONObject data = new JSONObject();
			try {
				data.put("status", "fail");
				data.put("version", gtSdk.getVersionInfo());

			} catch (JSONException e) {
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			out.println(data.toString());
		}

	}
	
	/**
	 * 极验功能的初始化
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/init")
	@ResponseBody
	public void startValidate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(),
				GeetestConfig.isnewfailback());

		String resStr = "{}";
		// 自定义userid
		String user_id = "test";
		// 进行验证预处理
		int gtServerStatus = gtSdk.preProcess(user_id);
		// 将服务器状态设置到session中
		request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
		// 将userid设置到session中
		request.getSession().setAttribute("userid", user_id);
		resStr = gtSdk.getResponseStr();
		PrintWriter out = response.getWriter();
		out.println(resStr);

	}

	
	@RequestMapping("/Loginout")
	public String Loginout(HttpSession session) {
		session.removeAttribute("user");
		
		return "index";
	}
	
	
	
	@RequestMapping("/selectPassword")
	public @ResponseBody User  selectPassword(User user,HttpSession session) {		
		user = userService.selectPassword(user); 
		if(user!=null){
		session.setAttribute("flag",user.getUserId());
		}
		return user;
	}
	
	
}
