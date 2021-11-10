package com.kh.groubear.lyj.commute.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.groubear.lyj.commute.model.service.CommuteService;
import com.kh.groubear.lyj.commute.model.vo.Commute;
import com.kh.groubear.lyj.commute.model.vo.Leave;
import com.kh.groubear.member.model.service.MemberService;
import com.kh.groubear.member.model.vo.Member;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService commuteService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("recordForm.cm")
	public String recordForm(HttpSession session, Model model) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int eno = m.getEmpNO();
		System.out.println("eno : " + eno);
		
		/*
		int commuteIs = commuteService.selectCommuteCount(eno);
		System.out.println("commuteIs : " + commuteIs);
		model.addAttribute("commuteIs", commuteIs);
		*/
		
		Commute cm = commuteService.selectCommute(eno);
		int commuteIs = 0;
		
		if (cm == null) {
			commuteIs = 0;
		} else if (cm.getWorktimeStart() != null && cm.getWorktimeEnd() == null) {
			commuteIs = 1;
		} else if (cm.getWorktimeStart() != null && cm.getWorktimeEnd() != null) {
			commuteIs = 2;
		} else {
			System.out.println("commuteIs error");
		}
		
		System.out.println("commuteIs : " + commuteIs);
		model.addAttribute("commuteIs", commuteIs);
		
		return "lyj/commute/commuteRecordForm";
	}
	
	@RequestMapping("insertStart.cm")
	public String insertStart(HttpSession session, Model model) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int eno = m.getEmpNO();
		
		commuteService.insertStart(eno);
		
		return "redirect:recordForm.cm";
	}
	
	@RequestMapping("updateEnd.cm")
	public String updateEnd(HttpSession session, Model model) {
		
		Member m = (Member) session.getAttribute("loginUser");
		int eno = m.getEmpNO();
		
		commuteService.updateEnd(eno);
		
		return "redirect:recordForm.cm";
	}
	
	@RequestMapping("myRecord.cm")
	public String myRecord(HttpSession session, Model model) {
				
		return "lyj/commute/commuteMyRecord";
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.cm", produces="application/json; charset=utf-8")
	public String selectCommuteList(int eno, String startDate, String endDate) {
		
//		System.out.println("rlist.cm 실행됨!!");
		
		// 이번주 구하기
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		int iDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		Date dt = new Date();
		long unix_time = dt.getTime() / 1000;
		long startDateLong = unix_time - iDayOfWeek * 86400;
		long endDateLong = unix_time;
		
		for (int y = iDayOfWeek; y < 6; y++) {
			endDateLong = endDateLong + 86400;
		}
		Date dt2 = new Date(startDateLong * 1000);
		Date dt3 = new Date(endDateLong * 1000);
		String sStart = sdf.format(dt2);
		String sEnd = sdf.format(dt3);
		
		System.out.println("sStart : " + sStart);
		System.out.println("sEnd : " + sEnd);
		
		if (startDate == "") {
			startDate = sStart;
		}
		if (endDate == "") {
			endDate = sEnd;
		}
		
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		
		
		ArrayList<Commute> list = commuteService.selectCommuteList(eno, startDate, endDate);
		
//		System.out.println(list.get(0).getCreateDate().toString());
		
//		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
		
		return new GsonBuilder().create().toJson(list);
		
	}
	
	@RequestMapping("allRecord.cm")
	public String allRecord(HttpSession session, Model model) {
				
		return "lyj/commute/commuteAllRecord";
	}
	
	@ResponseBody
	@RequestMapping(value="rlistAll.cm", produces="application/json; charset=utf-8")
	public String selectCommuteAllList(int eno, String startDate, String endDate) {
			
		// 이번주 구하기
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		int iDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		Date dt = new Date();
		long unix_time = dt.getTime() / 1000;
		long startDateLong = unix_time - iDayOfWeek * 86400;
		long endDateLong = unix_time;
		
		for (int y = iDayOfWeek; y < 6; y++) {
			endDateLong = endDateLong + 86400;
		}
		Date dt2 = new Date(startDateLong * 1000);
		Date dt3 = new Date(endDateLong * 1000);
		String sStart = sdf.format(dt2);
		String sEnd = sdf.format(dt3);
		
		System.out.println("sStart : " + sStart);
		System.out.println("sEnd : " + sEnd);
		
		if (startDate == "") {
			startDate = sStart;
		}
		if (endDate == "") {
			endDate = sEnd;
		}
		
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		
		
		ArrayList<Commute> list = commuteService.selectCommuteAllList(eno, startDate, endDate);
		
		return new GsonBuilder().create().toJson(list);
		
	}
	
	
	// Leave
	@RequestMapping("leaveMyRecord.lv")
	public String leaveRecord(HttpSession session, Model model) {
		
		return "lyj/commute/leaveMyRecord";
	}
		
	@RequestMapping(value = "createModalView.lv", method = RequestMethod.GET)
	public String modelPopUp(Model model) {

		ArrayList<Member> mList = memberService.selectMemberList();
		
	    model.addAttribute("mList", mList);

	    return "lyj/commute/modal/leaveCreateForm";
	}
	
	@RequestMapping("insert.lv")
	public String insertLeave(HttpServletRequest request, Model model, int count, int empNo) {

		for (int i=0; i<count; i++) {
			commuteService.insertLeave(empNo);
		}
		
		return "redirect:leaveMyRecord.lv";
	}
	
	@RequestMapping("update.lv")
	public String updateLeave(HttpServletRequest request, Model model, String leaveUseDate, int eno) {

		commuteService.updateLeave(leaveUseDate, eno);
		
		return "redirect:leaveMyRecord.lv";
	}
	
	@ResponseBody
	@RequestMapping(value="ulist.lv", produces="application/json; charset=utf-8")
	public String selectLeaveUseList(int eno) {
		
		ArrayList<Leave> list = commuteService.selectLeaveUseList(eno);
		
		return new GsonBuilder().create().toJson(list);
		
	}
	
	@ResponseBody
	@RequestMapping(value="clist.lv", produces="application/json; charset=utf-8")
	public String selectLeaveCreateList(int eno) {
		
		ArrayList<Leave> list = commuteService.selectLeaveCreateList(eno);
		
		return new GsonBuilder().create().toJson(list);
		
	}
	

}
