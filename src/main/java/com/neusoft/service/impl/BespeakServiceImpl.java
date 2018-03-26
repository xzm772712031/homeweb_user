package com.neusoft.service.impl;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.neusoft.mapper.BespeakMapper;
import com.neusoft.mapper.ServicetypeMapper;
import com.neusoft.pojo.Bespeak;
import com.neusoft.pojo.Servicetype;
import com.neusoft.service.BespeakService;
@Transactional
@Service
public class BespeakServiceImpl implements BespeakService {
@Autowired
  ServicetypeMapper servicetypeMapper;
@Autowired
  BespeakMapper bespeakMapper;

	@Override
	public List<Servicetype> showtype() {
		return servicetypeMapper.showtype();
	}
	
	@Override
	public int addbespeak(Bespeak bespeak) {
	
		return bespeakMapper.insert(bespeak);
	}
	
	@Override
	public List<Bespeak> showUserBespeaks(Bespeak bespeak) {
		 List<Bespeak> blist= bespeakMapper.selectByuserId(bespeak);
		 SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		 for (int i=0;i<blist.size();i++) { 
			 blist.get(i).setStrDate(f.format(blist.get(i).getBespeakDate()));	 
			 blist.get(i).setStrDate2(f.format(blist.get(i).getDate()));	 
			 
		}
		return blist;
	}
	
	@Override
	public Bespeak showbespeak(int bespeakId) {
		 SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		 SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd");  
		 Bespeak bespeak = bespeakMapper.selectByPrimaryKey(bespeakId);
		 bespeak.setStrDate(f2.format(bespeak.getBespeakDate()));
		 bespeak.setStrDate2(f.format(bespeak.getDate()));
		 return bespeak;
	}

	@Override
	public int updateBespeak(Bespeak bespeak) {
	    
		return bespeakMapper.updateByPrimaryKeySelective(bespeak);
	}

	@Override
	public int deleteBespeak(int bespeakId) {
		
		return bespeakMapper.deleteByPrimaryKey(bespeakId);
	}

	
	
	
}
