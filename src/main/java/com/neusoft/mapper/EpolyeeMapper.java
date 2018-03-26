package com.neusoft.mapper;

import com.neusoft.pojo.Epolyee;
import com.neusoft.pojo.EpolyeeExample;

import java.util.HashMap;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Service;
@Service
public interface EpolyeeMapper {
    long countByExample(EpolyeeExample example);

    int deleteByExample(EpolyeeExample example);

    int deleteByPrimaryKey(Integer epolyeeId);

    int insert(Epolyee record);

    int insertSelective(Epolyee record);

    List<Epolyee> selectByExample(EpolyeeExample example);

    Epolyee selectByPrimaryKey(Integer epolyeeId);
    
    List<Epolyee> selectEpolyee(HashMap<String,Object> map);
   
    int  count(Epolyee epolyee);
    
    int updateByExampleSelective(@Param("record") Epolyee record, @Param("example") EpolyeeExample example);

    int updateByExample(@Param("record") Epolyee record, @Param("example") EpolyeeExample example);

    int updateByPrimaryKeySelective(Epolyee record);

    int updateByPrimaryKey(Epolyee record);
}