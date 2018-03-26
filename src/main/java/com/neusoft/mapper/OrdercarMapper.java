package com.neusoft.mapper;

import com.neusoft.pojo.Ordercar;
import com.neusoft.pojo.OrdercarExample;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.NotEmpty;

public interface OrdercarMapper {
    long countByExample(OrdercarExample example);

    int deleteByExample(OrdercarExample example);

    int deleteByPrimaryKey(Integer orderCarId);

    int insert(Ordercar record);

    int insertSelective(Ordercar record);

    List<Ordercar> selectByExample(OrdercarExample example);

    Ordercar selectByPrimaryKey(Integer orderCarId);

    int updateByExampleSelective(@Param("record") Ordercar record, @Param("example") OrdercarExample example);

    int updateByExample(@Param("record") Ordercar record, @Param("example") OrdercarExample example);

    int updateByPrimaryKeySelective(Ordercar record);

    int updateByPrimaryKey(Ordercar record);
}