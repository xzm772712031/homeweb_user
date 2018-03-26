package com.neusoft.service;

import java.util.List;

import com.neusoft.pojo.Order;
import com.neusoft.pojo.Ordercar;
import com.neusoft.pojo.Orderepolyee;

public interface OrderService {
	public List<Order> showOrder();
	public List<Order> showOrderByUserId(int userId);
	public List<Ordercar> showOrdercars(int order_Id);
	public List<Orderepolyee> showOrderepolyees(int order_Id);
	public Order showOrder(int orderId); 
	public int updateOrder(Order order);
	public int deleteOrder(int orderId);
}
