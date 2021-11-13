package com.kh.groubear.jsh.Messenger.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.groubear.jsh.Messenger.model.service.MessengerService;
import com.kh.groubear.jsh.Messenger.model.vo.Chat;
import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
import com.kh.groubear.jsh.Messenger.model.vo.Messenger;
import com.kh.groubear.jsh.Messenger.model.vo.StateMessage;
import com.kh.groubear.member.model.service.MemberService;
import com.kh.groubear.member.model.vo.Member;

@Controller
public class MessengerController implements HandlerInterceptor{
	
	
	@Autowired
	private MessengerService messengerService;

	
	@RequestMapping("messengerHome.msg")
	public String messengerHome(HttpSession session ,
			@RequestParam(value = "q1", required = false, defaultValue = "") String q,
			@RequestParam(value = "toEmpNo", required = false, defaultValue = "") String toEmpNo,
							Model model) {
		System.out.println("======================= toempNo :" + toEmpNo );
		// ======= 회원 목록
		Member user = (Member) session.getAttribute("loginUser");
	
		MemberMsg me = messengerService.loginMember(user);
		
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String query = "%" + q + "%";
		map.put("query", query);
		
		ArrayList<MemberMsg> emp = messengerService.memberList(map);
		
		model.addAttribute("emp", emp);
		model.addAttribute("me", me);
		
		MemberMsg toEmp = null;
		if(!toEmpNo.equals("") && toEmpNo != null) {
		toEmp = messengerService.selectEmp(Integer.parseInt(toEmpNo));
		
		}
		model.addAttribute("toEmp", toEmp);
		return "jsh/messenger/messengerHome";
		
		
		//  =====

		
		
	}
	
	@RequestMapping("updateStateMessage.msg")
	public String updateStateMessage(StateMessage stateMessage,  Model model) {
		System.out.println("stateMessge : " + stateMessage);
		

		
		if(stateMessage.getStateMessageNo() == 0) {
			
			messengerService.insertStateMessage(stateMessage);
			
		}else {
			messengerService.updateStateMessage(stateMessage);
		}
		
		return "redirect:messengerHome.msg";
		
	}
	
	@RequestMapping("insertMsg.msg")
	@ResponseBody
	public String insertMsg(HttpSession session,
			HttpServletResponse response,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "pwd", required = false, defaultValue = "") String pwd,
			Model model) {
		response.setHeader("Content-Type", "text/html;charset=UTF-8");
		Member user = (Member)session.getAttribute("loginUser");
		
		Messenger insertMsg = new Messenger();
		insertMsg.setTitle(title);
		insertMsg.setPwd(pwd);
		insertMsg.setEmpNO(user.getEmpNO());
		messengerService.insertMsg(insertMsg);
		
		
		
		return  "redirect:messengerHome.msg";
		
	}
	
	
	@RequestMapping("chatList.msg")
	public void chatList(HttpSession session,
					     @RequestParam("toEmpNo") int toEmpNo,
						 Model model) {
		Member user = (Member) session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("toEmpNo", toEmpNo);
		map.put("empNO", user.getEmpNO());
	
		ArrayList<Chat> chatList = messengerService.chatList(map);
		
		model.addAttribute("chatList", chatList);
		
	}
	@RequestMapping("chatListRecent.msg")
	public void chatListRecent(HttpSession session,
					     @RequestParam("toEmpNo") int toEmpNo,
					     @RequestParam("number") int number,
						 Model model) {
		Member user = (Member) session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("toEmpNo", toEmpNo);
		map.put("empNO", user.getEmpNO());
		map.put("number", number);
	
		ArrayList<Chat> chatListRecent = messengerService.chatListRecent(map);
		
		model.addAttribute("chatListRecent", chatListRecent);
		
	}
	
	@RequestMapping("transmit.msg")
	public void transmit(HttpSession session,
					     @RequestParam("toEmpNo") int toEmpNo,
					     @RequestParam("message") String message,
						 Model model) {
		Member user = (Member) session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("================== message =" + message);
		map.put("toEmpNo", toEmpNo);
		map.put("empNO", user.getEmpNO());
		map.put("message", message);
		 messengerService.transmit(map);
		
	}
	
	public String getTen(int empNO, int toEmpNo) {
		StringBuffer result = new StringBuffer("");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("toEmpNo", toEmpNo);
		map.put("empNO", empNO);
		map.put("number", 10);
		
		result.append("{\"result\":[");
		ArrayList<Chat> chatList = messengerService.chatListRecent(map);
		
		if(chatList.size() == 0 ) return "";
		
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\" : \"" + chatList.get(i).getEmpNO() + "\"},");
			result.append("[{\"value\" : \"" + chatList.get(i).getToEmpNo() + "\"},");
			result.append("[{\"value\" : \"" + chatList.get(i).getMessage() + "\"},");
			result.append("[{\"value\" : \"" + chatList.get(i).getCreateDate() + "\"}]");
			if(i != chatList.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}");
		
		return  result.toString();
	}
	
	public String getId(int empNO, int toEmpNo, int chatNo ) {
		StringBuffer result = new StringBuffer("");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("toEmpNo", toEmpNo);
		map.put("empNO", empNO);
		map.put("chatNo", chatNo);
		
		result.append("{\"result\":[");
		ArrayList<Chat> chatList = messengerService.chatList(map);
		
		if(chatList.size() == 0 ) return "";
		
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\" : \"" + chatList.get(i).getEmpNO() + "\"},");
			result.append("[{\"value\" : \"" + chatList.get(i).getToEmpNo() + "\"},");
			result.append("[{\"value\" : \"" + chatList.get(i).getMessage() + "\"},");
			result.append("[{\"value\" : \"" + chatList.get(i).getCreateDate() + "\"}]");
			if(i != chatList.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}");
		
		return  result.toString();
	}
}
