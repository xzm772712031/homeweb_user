package com.neusoft.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.neusoft.pojo.Insurance;
import com.neusoft.service.InsuranceService;

@Controller
public class InsuranceController {
	@Autowired
    InsuranceService insuranceService;
	 /**
	 * 客户保险
	 * @param currentPage
	 * @param model
	 * @param userId
	 * @return
	 */
	@RequestMapping("/selectAllInsurance")
	public String selectAllInsurance(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model,int userId) {
	    //创建保险对象实例
		Insurance insurance = new Insurance();
		//将前台获取的拥有Id传入保险对象
		insurance.setUser_Id(userId);
		//分页显示的页数
		int pageSize = 4;
		model.addAttribute("InsuranceAllMsg",insuranceService.selectInsurance(currentPage, insurance, pageSize, null));
		model.addAttribute("iklist", insuranceService.selectInsurance(currentPage, insurance, pageSize, null).getLists());
		return "InsuranceList";
	}
	
	/**
	 * 取消保险
	 * @param insuranceId
	 * @return
	 */
	@RequestMapping("/cancelInsurance")
	public @ResponseBody boolean cancelInsurance(int insuranceId) {
		insuranceService.deleteById(insuranceId);
		return true;
	}
	
	
	@RequestMapping("/showInsuranceDetail")
	public String showInsuranceDetail(int insuranceId,Model model) {
		model.addAttribute("insurance", insuranceService.searchById(insuranceId));
		return "InsuranceDetail";		
	}
	
	
	@RequestMapping("/updateInsuranceDetail")
	public @ResponseBody boolean updateInsuranceDetail(Insurance insurance) {
		insuranceService.updateinsurance(insurance);
		return true;		
	}
		
}

