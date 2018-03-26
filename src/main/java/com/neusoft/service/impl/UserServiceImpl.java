package com.neusoft.service.impl;


import com.neusoft.mapper.UserMapper;
import com.neusoft.pojo.User;
import com.neusoft.service.UserService;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;
	@Override
	public int register(User user) {
		return userMapper.insert(user);
	}
	
	@Override
	public int registerAdd(User user) {	
		return userMapper.updateByPrimaryKeySelective(user);
	}
	@Override
	public User login(User user) {
		return userMapper.login(user);
	}
	@Override
	public User SearchUserById(int userId) {
		
	    SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");  
		User user = userMapper.selectByPrimaryKey(userId);
		if(null!=user.getUserBirthday()){
		user.setStrDate(f.format(user.getUserBirthday()));
		}
		return user;
	}
	@Override
	public User selectPassword(User user) {
		return userMapper.selectPassword(user);
	}

	@Override
	public User checkAccount(User user) {
		
		return userMapper.selectByAccount(user);
	}

	@Override
	public int updateUser(User user) {
		
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public int updatepassword(User user) {
		
		return userMapper.updatePassword(user);
	}
	
}
