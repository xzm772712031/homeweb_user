package com.neusoft.service;

import java.util.List;


import com.neusoft.pojo.Bespeak;
import com.neusoft.pojo.Servicetype;

public interface BespeakService {
	public List<Servicetype>  showtype();
	public int addbespeak(Bespeak bespeak);
	public List<Bespeak> showUserBespeaks(Bespeak bspeak);
	public Bespeak showbespeak(int bespeakId);
	public int updateBespeak(Bespeak bespeak);
	public int deleteBespeak(int bespeakId);
	

}
