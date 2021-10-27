package com.kh.groubear.jsh.Messenger.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.groubear.jsh.Messenger.model.service.MessengerService;
import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
import com.kh.groubear.jsh.Messenger.model.vo.Messenger;
import com.kh.groubear.jsh.Messenger.model.vo.StateMessage;
import com.kh.groubear.member.model.vo.Member;

@Controller
public class MessengerController implements HandlerInterceptor{
	
	@Autowired
	private MessengerService messengerService;
	
	@RequestMapping("messengerHome.msg")
	public String messengerHome(HttpSession session ,
			@RequestParam(value = "q1", required = false, defaultValue = "") String q1,
			@RequestParam(value = "q2", required = false, defaultValue = "") String q2,
			@RequestParam(value = "q3", required = false, defaultValue = "") String q3,
							Model model) {
		// ======= 회원 목록
		Member user = (Member)session.getAttribute("loginUser");
		MemberMsg me = messengerService.loginMember(user);
		
		
		
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		String query1 = "%" + q1 + "%";
		map1.put("query1", query1);
		
		ArrayList<MemberMsg> emp = messengerService.memberList(map1);
		
		model.addAttribute("emp", emp);
		model.addAttribute("me", me);
		
		
		
		// ========= 대화 목록
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		String query2 = "%" + q2 + "%";
		map2.put("query2", query2);
		
		
		
		
		
		
		
		// ======= 대화방 리스트
		HashMap<String, Object> map3 = new HashMap<String, Object>();
		String query3 = "%" + q3 + "%";
		map3.put("query3", query3);
		
		ArrayList<Messenger> msgList = messengerService.msgList(map3);
		
		model.addAttribute("msgList", msgList);
		
		return "jsh/messenger/messengerHome";
		
	}
	
	@RequestMapping("updateStateMessage.msg")
	public String updateStateMessage(StateMessage stateMessage,  Model model) {
		System.out.println("stateMessge : " + stateMessage);
		messengerService.updateStateMessage(stateMessage);

		

		
		return "redirect:messengerHome.msg";
		
	}
	
	@RequestMapping("insertMsg.msg")
	public String insertMsg(@RequestParam(value = "title") String title,
			@RequestParam(value = "pwd", required = false, defaultValue = "") String pwd,
			@RequestParam(value = "empNO") String empNO,
			Model model) {
		Messenger insertMsg = new Messenger();
		insertMsg.setTitle(title);
		insertMsg.setPwd(pwd);
		insertMsg.setEmpNO(Integer.parseInt(empNO));
		System.out.println("========= insertMsg : " + insertMsg);
		messengerService.insertMsg(insertMsg);
		
		
		
		
		return "redirect:messengerHome.msg";
		
	}
	
	
}
