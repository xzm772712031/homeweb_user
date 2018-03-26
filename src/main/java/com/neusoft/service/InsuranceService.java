package com.neusoft.service;

import java.util.List;

import com.neusoft.pojo.Insurance;
import com.neusoft.pojo.PageBean;

public interface InsuranceService {
	
	public int addInsurance(Insurance insurance);
	
	public int deleteByBespeakId(int bespeakId);
		 
	public Insurance searchBespeakId(int BespeakId);
		
	public Insurance searchById(int insuranceId);
	
	public List<Insurance> serrchInsuranceList(int userId);
	
	public int deleteById(int insuranceId);
	
	public PageBean<Insurance> selectInsurance(int currentPage,Insurance insurance ,int pageSize,String flag);
		
	public int updateinsurance(Insurance insurance);
	
	
}
