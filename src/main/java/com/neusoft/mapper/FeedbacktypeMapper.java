package com.neusoft.mapper;

import com.neusoft.pojo.Feedbacktype;
import com.neusoft.pojo.FeedbacktypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FeedbacktypeMapper {
    long countByExample(FeedbacktypeExample example);

    int deleteByExample(FeedbacktypeExample example);

    int deleteByPrimaryKey(Integer feedbackTypeId);

    int insert(Feedbacktype record);

    int insertSelective(Feedbacktype record);

    List<Feedbacktype> selectByExample(FeedbacktypeExample example);

    Feedbacktype selectByPrimaryKey(Integer feedbackTypeId);
    
    List<Feedbacktype> selectAllftype();

    int updateByExampleSelective(@Param("record") Feedbacktype record, @Param("example") FeedbacktypeExample example);

    int updateByExample(@Param("record") Feedbacktype record, @Param("example") FeedbacktypeExample example);

    int updateByPrimaryKeySelective(Feedbacktype record);

    int updateByPrimaryKey(Feedbacktype record);
}