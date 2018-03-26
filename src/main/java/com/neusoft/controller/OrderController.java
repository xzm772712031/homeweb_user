package com.neusoft.controller;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neusoft.pojo.Bespeak;
import com.neusoft.pojo.Insurance;
import com.neusoft.pojo.Order;
import com.neusoft.pojo.Ordercar;
import com.neusoft.pojo.Orderepolyee;
import com.neusoft.pojo.User;
import com.neusoft.service.BespeakService;
import com.neusoft.service.InsuranceService;
import com.neusoft.service.OrderService;
import com.neusoft.service.UserService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	BespeakService bespeakService;
	@Autowired
	UserService userService;
	@Autowired
	InsuranceService insuranceService;
	
	@RequestMapping("/showOrder")
	public String showOrder(Model model){
		
		model.addAttribute("orderlist",orderService.showOrder());
		return "OrderList";	
	}
	/**
	 * 显示订单列表
	 * @param model
	 * @param userId
	 * @return
	 */
	
	@RequestMapping("/showOrderByuserId")
	public String showOrderByuserId(Model model,int userId){
		model.addAttribute("orderlist",orderService.showOrderByUserId(userId));
		return "OrderList";	
	}
	
	/**
	 * 显示订单详细
	 * @param model
	 * @param orderID
	 * @param userId
	 * @param bespeakId
	 * @return
	 */
	@RequestMapping("/showOrderDetail")
	public String showOrderDetail(Model model,int orderID,int userId,int bespeakId){
		//通过用户的Id获取相应的用户信息
		User user= userService.SearchUserById(userId);
	    //通过预约编号获取相应的预约信息
		Bespeak bespeak = bespeakService.showbespeak(bespeakId);
		//通过相应的订单Id获取安排车辆
		List<Ordercar> ordercarlist = orderService.showOrdercars(orderID);
		//通过相应的订单Id获取安排工作人员
		List<Orderepolyee> orderepolyeeList = orderService.showOrderepolyees(orderID);
		////通过相应的预约Id获取相应的保险信息
		Insurance insurance = insuranceService.searchBespeakId(bespeakId);
		model.addAttribute("userme", user);
		model.addAttribute("bespeak", bespeak);
		model.addAttribute("carlist", ordercarlist);
		model.addAttribute("epolyeelist", orderepolyeeList);
        model.addAttribute("order",orderService.showOrder(orderID));
        model.addAttribute("insurance", insurance);
		return "OrderDetail";	
	}
	
	
	@RequestMapping("/deleteorder")
	public @ResponseBody boolean deleteorder(int orderId){
		orderService.deleteOrder(orderId);
		return true;	
	}
	
	
	@RequestMapping("/updateOrderState")
	public @ResponseBody boolean updateOrderState(Order order){
		orderService.updateOrder(order);
		return true;	
	}
	
}

