package com.neusoft.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.mapper.FeedbackMapper;
import com.neusoft.mapper.FeedbacktypeMapper;
import com.neusoft.pojo.Feedback;
import com.neusoft.pojo.Feedbacktype;
import com.neusoft.pojo.PageBean;
import com.neusoft.service.FeedbackService;

@Service
public class FeedbackServiceImpl implements FeedbackService {
    @Autowired
    FeedbackMapper feedbackMapper;
    @Autowired
    FeedbacktypeMapper feedbacktypeMapper;
	@Override
	public int addFeedback(Feedback feedback) {
		
		return feedbackMapper.insertSelective(feedback);
	}
	
	
	@Override
	public Feedback showFeedbackById(int feedbackId) {
		Feedback feedback = feedbackMapper.selectByPrimaryKey(feedbackId);
		   SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		   feedback.setStrDate(f.format(feedback.getFeedbackDate()));
		return feedback;
	}
	
	
	@Override
	public int deleteFeedback(int feedbackId) {
		
		return feedbackMapper.deleteByPrimaryKey(feedbackId);
	}
	
	
	
	@Override
	public PageBean<Feedback> selectInsurance(int currentPage, Feedback feedback, int pageSize, String flag) {
		HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Feedback> pageBean = new PageBean<Feedback>();
        //封装当前页数
        pageBean.setCurrPage(currentPage);
        //每页显示的数据
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount = feedbackMapper.count();
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);
        pageBean.setTotalPage(num.intValue());
        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        map.put("user_Id", feedback.getUser_Id());
        //封装每页显示的数据
        List<Feedback> lists = feedbackMapper.selectFeedback(map);
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		 for (int i=0;i<lists.size();i++) { 
			 lists.get(i).setStrDate(f.format(lists.get(i).getFeedbackDate()));	 
			
		}
        pageBean.setLists(lists);  
        return pageBean;
	}
	
	
	
	@Override
	public List<Feedbacktype> selectALlType() {
	   
		return feedbacktypeMapper.selectAllftype();
	}
	
}
