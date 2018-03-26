package com.neusoft.mapper;

import com.neusoft.pojo.Feedback;
import com.neusoft.pojo.FeedbackExample;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface FeedbackMapper {
    long countByExample(FeedbackExample example);

    int deleteByExample(FeedbackExample example);

    int deleteByPrimaryKey(Integer feedbackId);

    int insert(Feedback record);

    int insertSelective(Feedback record);
    
    int count();
    
    List<Feedback> selectFeedback(HashMap<String,Object> map);

    List<Feedback> selectByExample(FeedbackExample example);

    Feedback selectByPrimaryKey(Integer feedbackId);

    int updateByExampleSelective(@Param("record") Feedback record, @Param("example") FeedbackExample example);

    int updateByExample(@Param("record") Feedback record, @Param("example") FeedbackExample example);

    int updateByPrimaryKeySelective(Feedback record);

    int updateByPrimaryKey(Feedback record);
}