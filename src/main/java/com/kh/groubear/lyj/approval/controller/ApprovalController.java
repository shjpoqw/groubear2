package com.kh.groubear.lyj.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groubear.lyj.Pagination;
import com.kh.groubear.lyj.approval.model.service.ApprovalService;
import com.kh.groubear.lyj.approval.model.vo.Approval;
import com.kh.groubear.lyj.approval.model.vo.ApprovalForm;
import com.kh.groubear.lyj.approval.model.vo.PageInfo;

@Controller
public class ApprovalController {
		
	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping("formList.ep")
	public String selectFormList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		int formListCount = approvalService.selectFormListCount();
		System.out.println(formListCount);
		PageInfo pi = Pagination.getPageInfo(formListCount, currentPage, 10, 5);
		
		ArrayList<ApprovalForm> formList = approvalService.selectFormList(pi);
		System.out.println(formList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("formList", formList);
		
		return "lyj/approval/approvalFormList";
		
	}
	
	@RequestMapping("write.ep")
	public ModelAndView writeForm(int ano, ModelAndView mv) {
		
		ApprovalForm af = approvalService.selectForm(ano);
		
		mv.addObject("af", af).setViewName("lyj/approval/approvalWrite");
		
		return mv;
	}
	
	@RequestMapping("sentList.ep")
	public String sentList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, int eno, Model model) {
		
		int sentListCount = approvalService.selectSentListCount(eno);
		System.out.println(sentListCount);
		PageInfo pi = Pagination.getPageInfo(sentListCount, currentPage, 10, 5);
		
		ArrayList<Approval> sentList = approvalService.selectSentList(pi, eno);
		System.out.println(sentList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("sentList", sentList);
		
		return "lyj/approval/approvalSentList";
	}
	
	@RequestMapping("receivedList.ep")
	public String receivedList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, int mNo, int fNo, Model model) {
		
		int receivedListCount = approvalService.selectReceivedListCount(mNo, fNo);
		System.out.println(receivedListCount);
		PageInfo pi = Pagination.getPageInfo(receivedListCount, currentPage, 10, 5);
		
		ArrayList<Approval> receivedList = approvalService.selectReceivedList(pi, mNo, fNo);
		System.out.println(receivedList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("receivedList", receivedList);
		
		return "lyj/approval/approvalReceivedList";
	}
	
	

}
