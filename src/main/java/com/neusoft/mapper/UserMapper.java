package com.neusoft.mapper;

import com.neusoft.pojo.User;
import com.neusoft.pojo.UserExample;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Service;
@Service
public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer userId);
    
    User selectByAccount(User user);
    
    User login(User user);
    
    int updatePassword(User user);
    
    User selectPassword(User user);
    
    
    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}