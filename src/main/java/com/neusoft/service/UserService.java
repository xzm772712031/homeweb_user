package com.neusoft.service;

import com.neusoft.pojo.User;

public interface UserService {
	
	public int register(User user);
    public User checkAccount(User user);
    public int registerAdd(User user);
    public User login(User user);
    public User SearchUserById(int userId);
    public User selectPassword(User user);
    public int updateUser(User user);
    public int updatepassword(User user);
    
    
}
