package com.neusoft.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.OrderMapper;
import com.neusoft.pojo.Order;
import com.neusoft.pojo.Ordercar;
import com.neusoft.pojo.Orderepolyee;
import com.neusoft.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderMapper;

	@Override
	public List<Order> showOrder() {
		List<Order> orderlist = orderMapper.selectOrder();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for (int i = 0; i < orderlist.size(); i++) {
			orderlist.get(i).setStrDate(f.format(orderlist.get(i).getOrderDate()));
		}
		return orderlist;
	}

	@Override
	public List<Order> showOrderByUserId(int userId) {
		List<Order> orderlist = orderMapper.selectOrderByUserId(userId);
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for (int i = 0; i < orderlist.size(); i++) {
			orderlist.get(i).setStrDate(f.format(orderlist.get(i).getOrderDate()));
		}
		return orderlist;
	}

	@Override
	public List<Ordercar> showOrdercars(int order_Id) {

		return orderMapper.selectOrderCar(order_Id);
	}

	@Override
	public List<Orderepolyee> showOrderepolyees(int order_Id) {

		return orderMapper.selectOrderEpolyee(order_Id);
	}

	@Override
	public Order showOrder(int orderId) {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		Order order = orderMapper.selectByPrimaryKey(orderId);
		order.setStrDate(f.format(order.getOrderDate()));
		return order;
	}

	@Override
	public int updateOrder(Order order) {	
		return orderMapper.updateByPrimaryKeySelective(order);
	}
	
	
	@Override
	public int deleteOrder(int orderId) {		
		return orderMapper.deleteByPrimaryKey(orderId);
	}
	
	

}
