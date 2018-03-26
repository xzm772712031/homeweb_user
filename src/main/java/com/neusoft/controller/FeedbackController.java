package com.neusoft.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.neusoft.pojo.Feedback;
import com.neusoft.pojo.Order;
import com.neusoft.service.FeedbackService;
import com.neusoft.service.OrderService;

@Controller
public class FeedbackController {
	@Autowired
	FeedbackService feedbackService;
	@Autowired
	OrderService orderService;
	/**
	 * 提交反馈
	 * @param request
	 * @param items_pic
	 * @param feedback
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/feedback")
	public  @ResponseBody String addFeedback(HttpServletRequest request, MultipartFile items_pic,Feedback feedback) throws Exception {
		//获取上传图片的原始名称
		  Order order = new Order();
		  order.setOrderId(feedback.getOrder_Id());  
		  order.setOrderState(5);
		 String fileName = items_pic.getOriginalFilename();  
	        System.out.println("原始文件名:" + fileName);  
	        // 新文件名 ，加入随机的32位字符编号，避免同名文件的产生 
	        String newFileName = UUID.randomUUID() + fileName;  
	        //文件保存的物理路径，调用时使用配置的虚拟陆行，方便图片在页面中的侠士
            String path = "D:\\test\\";
            //初始化文件的对象
	        File f = new File(path);  
	        //判断文件是否存在
	        if (!f.exists())  
	            f.mkdirs();  
	        if (!items_pic.isEmpty()) {
	            try {  
	            	//创建并初始化文件刘，并加载相应的保存路径
	                FileOutputStream fos = new FileOutputStream(path + newFileName);  
	                //文件输入流
	                InputStream in = items_pic.getInputStream();  
	                int b = 0;  
	                //写入文件
	                while ((b = in.read()) != -1) {  
	                    fos.write(b);
	                }  
	                fos.close(); 
	                in.close();  
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }  
	     //当亲的日期   
		Date date = new Date();
		feedback.setFeedbackImage(newFileName);
		feedback.setFeedbackDate(date);
		feedback.setFeedbackState(0);
		feedbackService.addFeedback(feedback);
		orderService.updateOrder(order);
	        return "反馈成功，可以关闭本窗口。";	
	}
	/**
	 * 删除反馈
	 * @param feedbackId
	 * @return
	 */
	@RequestMapping("/deleteFeedback")
	public  @ResponseBody boolean deleteFeedback(int feedbackId)  {
		feedbackService.deleteFeedback(feedbackId);
	        return true;	
	}
	
	/**
	 * 显示反馈的类别
	 * @param model
	 * @param userId
	 * @param orderID
	 * @return
	 */
	@RequestMapping("/showftype")
	public  String showftype(Model model,int userId,int orderID)  {		
		model.addAttribute("typelist", feedbackService.selectALlType());
		model.addAttribute("userId", userId);
		model.addAttribute("orderID", orderID);
        return "FeedBack";
		
	}
		
	@RequestMapping("/showFeedback")
	public  String showFeedback(int feedbackId,Model model)  {	
		
		    model.addAttribute("feedback", feedbackService.showFeedbackById(feedbackId));
		    
	        return "FeedBackDetail";
		
	}
	@RequestMapping("/showFeedbackList")
	public  String showFeedbackList(int feedbackId)  {	
	        return "addbespeak";
	}
   /**
    * 显示反馈的列表
    * @param currentPage
    * @param model
    * @param userId
    * @return
    */
	@RequestMapping("/selectAllFeedBack")
	public String selectAllFeedBack(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model,int userId) {
		Feedback feedback = new Feedback();
		feedback.setUser_Id(userId);
	    //分页显示每页的页数
		int pageSize = 1000;
		model.addAttribute("FeedBackAllMsg",feedbackService.selectInsurance(currentPage, feedback, pageSize, null));
		model.addAttribute("fklist",feedbackService.selectInsurance(currentPage, feedback, pageSize, null).getLists() );
		return "FeedBackList";
	}
	
	@RequestMapping("/selectFeedBackAll")
	public String selectFeedBackAll(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		Feedback feedback = new Feedback();
		feedback.setUser_Id(null);
	    //分页显示每页的页数
		int pageSize = 4;
		model.addAttribute("FeedBackAllMsg",feedbackService.selectInsurance(currentPage, feedback, pageSize, null));
		model.addAttribute("fklist",feedbackService.selectInsurance(currentPage, feedback, pageSize, null).getLists() );
		return "feedbackall";
	}
	

}
