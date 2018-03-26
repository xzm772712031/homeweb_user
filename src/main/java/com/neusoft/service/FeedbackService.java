package com.neusoft.service;

import java.util.List;

import com.neusoft.pojo.Feedback;
import com.neusoft.pojo.Feedbacktype;
import com.neusoft.pojo.PageBean;

public interface FeedbackService {
	public int addFeedback(Feedback feedback);
	public Feedback showFeedbackById(int feedbackId);
    public int deleteFeedback(int feedbackId);
    public PageBean<Feedback> selectInsurance(int currentPage,Feedback feedback ,int pageSize,String flag);
    public List<Feedbacktype> selectALlType();
}
