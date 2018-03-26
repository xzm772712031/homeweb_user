package com.neusoft.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neusoft.pojo.Insurance;
import com.neusoft.service.NewsService;

@Controller
public class NewsController {
	@Autowired
	NewsService newsService;
	/**
	 * 显示列表
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectAllnews")
	public String selectAllInsurance(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		int pageSize = 6;
		model.addAttribute("NewsAllMsg",newsService.selectnews(currentPage, pageSize));
		model.addAttribute("nklist", newsService.selectnews(currentPage, pageSize).getLists());
		return "news";
	}
	
	/**
	 * 删除新闻
	 * @param newsId
	 * @return
	 */
	@RequestMapping("/deletenews")
	public @ResponseBody boolean deletenews(int newsId) {
		newsService.deleteNews(newsId);
		return true;
	}
	
	
	@RequestMapping("/selectAllanswer")
	public String selectAllanswer(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		int pageSize = 100;
		model.addAttribute("NewsAllMsg",newsService.selectanswer(currentPage, pageSize));
		model.addAttribute("aklist", newsService.selectanswer(currentPage, pageSize).getLists());
		return "answer";
	}
	
	@RequestMapping("/selectanswer")
	public String selectanswer(int newsId,Model model) {
		model.addAttribute("answer",newsService.selectbyId(newsId));
		return "answerdetail";
	}
}
