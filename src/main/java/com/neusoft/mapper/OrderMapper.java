package com.neusoft.mapper;

import com.neusoft.pojo.Order;
import com.neusoft.pojo.OrderExample;
import com.neusoft.pojo.Ordercar;
import com.neusoft.pojo.Orderepolyee;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.NotEmpty;

public interface OrderMapper {
    long countByExample(OrderExample example);

    int deleteByExample(OrderExample example);

    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);
    
    List<Order> selectOrder();
    
    List<Order> selectOrderByUserId(int userId);
    
    List<Ordercar> selectOrderCar(int orderId);
    
    List<Orderepolyee> selectOrderEpolyee(int orderId);

    Order selectByPrimaryKey(Integer orderId);

    int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}