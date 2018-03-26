package com.neusoft.mapper;

import com.neusoft.pojo.Bespeak;
import com.neusoft.pojo.BespeakExample;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Service;
@Service
public interface BespeakMapper {
    long countByExample(BespeakExample example);

    int deleteByExample(BespeakExample example);

    int deleteByPrimaryKey(Integer bespeakId);

    int insert(Bespeak record);

    int insertSelective(Bespeak record);

    List<Bespeak> selectByExample(BespeakExample example);

    Bespeak selectByPrimaryKey(Integer bespeakId);
    
    List<Bespeak> selectByuserId(Bespeak bespeak);

    int updateByExampleSelective(@Param("record") Bespeak record, @Param("example") BespeakExample example);

    int updateByExample(@Param("record") Bespeak record, @Param("example") BespeakExample example);

    int updateByPrimaryKeySelective(Bespeak record);

    int updateByPrimaryKey(Bespeak record);
}