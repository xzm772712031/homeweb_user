package com.neusoft.mapper;

import com.neusoft.pojo.Insurance;
import com.neusoft.pojo.InsuranceExample;

import java.util.HashMap;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.NotEmpty;

public interface InsuranceMapper {
    long countByExample(InsuranceExample example);

    int deleteByExample(InsuranceExample example);

    int deleteByPrimaryKey(Integer insuranceId);

    int insert(Insurance record);

    int insertSelective(Insurance record);
    
    int deleteByBespeakId(Integer bespeakId);
    
    Insurance  selectByBespeakId(int bespeakId);

    List<Insurance> selectByExample(InsuranceExample example);
    
    int count();
    
    List<Insurance> selectInsurance(HashMap<String,Object> map);

    Insurance selectByPrimaryKey(Integer insuranceId);

    int updateByExampleSelective(@Param("record") Insurance record, @Param("example") InsuranceExample example);

    int updateByExample(@Param("record") Insurance record, @Param("example") InsuranceExample example);

    int updateByPrimaryKeySelective(Insurance record);

    int updateByPrimaryKey(Insurance record);
}