package com.neusoft.mapper;

import com.neusoft.pojo.Orderepolyee;
import com.neusoft.pojo.OrderepolyeeExample;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.NotEmpty;

public interface OrderepolyeeMapper {
    long countByExample(OrderepolyeeExample example);

    int deleteByExample(OrderepolyeeExample example);

    int deleteByPrimaryKey(Integer orderdEpolyeeId);

    int insert(Orderepolyee record);

    int insertSelective(Orderepolyee record);

    List<Orderepolyee> selectByExample(OrderepolyeeExample example);

    Orderepolyee selectByPrimaryKey(Integer orderdEpolyeeId);

    int updateByExampleSelective(@Param("record") Orderepolyee record, @Param("example") OrderepolyeeExample example);

    int updateByExample(@Param("record") Orderepolyee record, @Param("example") OrderepolyeeExample example);

    int updateByPrimaryKeySelective(Orderepolyee record);

    int updateByPrimaryKey(Orderepolyee record);
}