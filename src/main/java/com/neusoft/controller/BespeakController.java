package com.neusoft.controller;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.hibernate.validator.internal.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neusoft.pojo.Bespeak;
import com.neusoft.pojo.Insurance;
import com.neusoft.pojo.User;
import com.neusoft.service.BespeakService;
import com.neusoft.service.InsuranceService;

@Controller
public class BespeakController {
	@Autowired
	BespeakService bespeakService;
	@Autowired
	InsuranceService insuranceService;
	/**
	 * 显示服务类型
	 * @param model
	 * @return
	 */
	@RequestMapping("/showtype")
	public  String showtype(Model model) {
	        model.addAttribute("typelist", bespeakService.showtype());
	        return "addbespeak";
	}
	/**
	 * 客户在线预约
	 * @param bespeak
	 * @param session
	 * @param insurance
	 * @param flag
	 * @return
	 */
	@RequestMapping("/addbespeak")
	public  @ResponseBody  boolean addBespeak(Bespeak bespeak,HttpSession session,Insurance insurance,String flag) {
		   User user = (User) session.getAttribute("user");
		   int user_Id = user.getUserId();
		   bespeak.setUser_Id(user_Id);		   
		   Date date = new Date();
		   bespeak.setDate(date);
		   bespeak.setBespeakState(0);
           int count = bespeakService.addbespeak(bespeak);
     	   System.out.println(bespeak.getBespeakId());    
           if(count!=0&&null!=flag){	  
     		  insurance.setBespeak_Id(bespeak.getBespeakId());
     		  insurance.setInsuranceDate(date);
     		  insurance.setUser_Id(user_Id);
     		  insurance.setInsuranceState(0);
     		  insuranceService.addInsurance(insurance);  
     	   }
	       return true;
	}
	
	/**
	 * 查看预约列表
	 * @param model
	 * @param bespeak
	 * @return
	 */
	@RequestMapping("/userbespeaks")
	public  String showUserBespeaks(Model model, Bespeak bespeak ) {
	        model.addAttribute("userbespeaks", bespeakService.showUserBespeaks(bespeak));
	        return "bespeaklist";
		
	}
	
	/**
	 * 查看预约详情
	 * @param model
	 * @param bespeakId
	 * @return
	 */
	@RequestMapping("/showBespeak")
	public  String showBespeak(Model model, int bespeakId ) {	
	        model.addAttribute("bespeak",bespeakService.showbespeak(bespeakId));      
	        return "bespeakstate";
		
	}
	
	@RequestMapping("/showupdate")
	public String showupdate(Model model,int bespeakId) {
			
		model.addAttribute("typelist", bespeakService.showtype());	
		model.addAttribute("b", bespeakService.showbespeak(bespeakId));
		return "UpdateBespeak";	   
	}
	
	/**
	 * 取消预约
	 * @param model
	 * @param bespeakId
	 * @return
	 */
	@RequestMapping("/deleteBespeak")
	public String deleteBespeak(Model model,int bespeakId, HttpSession session) {
		Insurance insurance = insuranceService.searchBespeakId(bespeakId);
		int userid = (int) session.getAttribute("flag");
		if(insurance!=null){	
			insuranceService.deleteByBespeakId(bespeakId);		
		}
		bespeakService.deleteBespeak(bespeakId);
		return "forward:/userbespeaks?user_Id="+userid;
	}

	@RequestMapping("/updateBespeak")
	public  @ResponseBody boolean updateBespeak(Bespeak bespeak ) {
		    int count = bespeakService.updateBespeak(bespeak);
		 if(count!=0){	 
			 return true;
		 }
		 else{
	        return false;
		 }
	}
	
	@RequestMapping("/updateBespeakState")
	public  @ResponseBody boolean updateBespeakState(Bespeak bespeak ) {
		    int count = bespeakService.updateBespeak(bespeak);
		 if(count!=0){	 
			 
			 Insurance insurance = insuranceService.searchBespeakId(bespeak.getBespeakId());
			
				if(insurance!=null){	
					insuranceService.deleteByBespeakId(bespeak.getBespeakId());		
				}
			 
			 
			 return true;
		 }
		 else{
	        return false;
		 }
	}
	
}

