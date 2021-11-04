package com.kh.groubear.lyj.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.groubear.lyj.Pagination;
import com.kh.groubear.lyj.approval.model.service.ApprovalService;
import com.kh.groubear.lyj.approval.model.vo.Approval;
import com.kh.groubear.lyj.approval.model.vo.ApprovalForm;
import com.kh.groubear.lyj.approval.model.vo.PageInfo;
import com.kh.groubear.lyj.approval.model.vo.Reply;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;

@Controller
public class ApprovalController {
		
	@Autowired
	private ApprovalService approvalService;
	
	// 문서 작성
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
	
	@RequestMapping(value = "modalView.ep", method = RequestMethod.GET)
	public String modelPopUp(Model model) {

		ArrayList<Member> mList = approvalService.selectMemberList();
		System.out.println("write.ep mList : " + mList);
		
	    model.addAttribute("mList", mList);

	    return "lyj/approval/modal/viewResult";
	}
	
	@RequestMapping("insert.ep")
	public String insertApproval(Approval a, HttpServletRequest request, Model model) {
		
		System.out.println(a);
		
		approvalService.insertApproval(a);
		
		return "redirect:sentList.ep";
	}
	
	
	// 상신 문서함
	@RequestMapping("sentList.ep")
	public String sentList(HttpSession session, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int eno = m.getEmpNO();
//		System.out.println("sentList.ep eno : " + eno);
		
		int sentListCount = approvalService.selectSentListCount(eno);
		System.out.println(sentListCount);
		PageInfo pi = Pagination.getPageInfo(sentListCount, currentPage, 10, 5);
		
		ArrayList<Approval> sentList = approvalService.selectSentList(pi, eno);
		System.out.println(sentList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("sentList", sentList);
		
		return "lyj/approval/approvalSentList";
	}
	
	@RequestMapping("sentDetail.ep")
	public ModelAndView selectApproval(int ano, ModelAndView mv) {
		
		Approval a = approvalService.selectApproval(ano);
		
		int mno = a.getApprovalMNo();
		int fno = a.getApprovalFNo();
		int wno = a.getWriterNo();
		
		MemberView mEmp = approvalService.selectMEmp(ano, mno);
		MemberView fEmp = approvalService.selectFEmp(ano, fno);
		MemberView wEmp = approvalService.selectWEmp(ano, wno);
		
		mv.addObject("a", a);
		mv.addObject("mEmp", mEmp);
		mv.addObject("fEmp", fEmp);
		mv.addObject("wEmp", wEmp);
		
		mv.setViewName("lyj/approval/approvalSentDetailView");
		
		return mv;
		
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.ep", produces="application/json; charset=utf-8")
	public String selectReplyList(int ano) {
		
		ArrayList<Reply> list = approvalService.selectReplyList(ano);
		
//		System.out.println(list.get(0).getCreateDate().toString());
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
		
	}
	
	@ResponseBody
	@RequestMapping("rinsert.ep")
	public String insertReply(Reply r) {
		int result = approvalService.insertReply(r);
		
		return String.valueOf(result);
		
	}
	
	
	// 결재 문서함
	@RequestMapping("receivedList.ep")
	public String receivedList(HttpSession session, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int eno = m.getEmpNO();
		
		int receivedListCount = approvalService.selectReceivedListCount(eno);
		System.out.println(receivedListCount);
		PageInfo pi = Pagination.getPageInfo(receivedListCount, currentPage, 10, 5);
		
		ArrayList<Approval> receivedList = approvalService.selectReceivedList(pi, eno);
		System.out.println(receivedList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("receivedList", receivedList);
		
		return "lyj/approval/approvalReceivedList";
	}
	
	@RequestMapping("receivedDetail.ep")
	public ModelAndView selectReceivedApproval(int ano, ModelAndView mv) {
		
		Approval a = approvalService.selectApproval(ano);
		
		int mno = a.getApprovalMNo();
		int fno = a.getApprovalFNo();
		int wno = a.getWriterNo();
		
		MemberView mEmp = approvalService.selectMEmp(ano, mno);
		MemberView fEmp = approvalService.selectFEmp(ano, fno);
		MemberView wEmp = approvalService.selectWEmp(ano, wno);
		
		mv.addObject("a", a);
		mv.addObject("mEmp", mEmp);
		mv.addObject("fEmp", fEmp);
		mv.addObject("wEmp", wEmp);
		
		mv.setViewName("lyj/approval/approvalReceivedDetailView");
		
		return mv;
		
	}
	
	
	// 임시 저장함
	@RequestMapping("tempSentList.ep")
	public String tempSentList(HttpSession session, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int eno = m.getEmpNO();
		
		int tempSentListCount = approvalService.selectTempSentListCount(eno);
		System.out.println(tempSentListCount);
		PageInfo pi = Pagination.getPageInfo(tempSentListCount, currentPage, 10, 5);
		
		ArrayList<Approval> tempSentList = approvalService.selectTempSentList(pi, eno);
		System.out.println(tempSentList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("tempSentList", tempSentList);
		
		return "lyj/approval/approvalTempSentList";
	}
	
	@RequestMapping("tempWrite.ep")
	public ModelAndView tempSaveWrite(int ano, ModelAndView mv) {
		
		Approval a = approvalService.selectApproval(ano);
		
		int mno = a.getApprovalMNo();
		int fno = a.getApprovalFNo();
		int wno = a.getWriterNo();
		
		MemberView mEmp = approvalService.selectMEmp(ano, mno);
		MemberView fEmp = approvalService.selectFEmp(ano, fno);
		MemberView wEmp = approvalService.selectWEmp(ano, wno);
		
		mv.addObject("a", a);
		mv.addObject("mEmp", mEmp);
		mv.addObject("fEmp", fEmp);
		mv.addObject("wEmp", wEmp);
		
		mv.setViewName("lyj/approval/approvalTempWrite");
		
		return mv;
		
	}
	
	@RequestMapping("update.ep")
	public ModelAndView updateApproval(Approval a, ModelAndView mv, HttpServletRequest request) {
		
		approvalService.updateApproval(a);
		
		mv.setViewName("lyj/approval/approvalSentList");
		
//		mv.addObject("ano", a.getApprovalNo()).setViewName("redirect:sentDetail.ep");
		return mv;
		
	}
	

}
