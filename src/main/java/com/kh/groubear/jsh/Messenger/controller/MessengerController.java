package com.kh.groubear.jsh.Messenger.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerInterceptor;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.groubear.jsh.Messenger.model.service.MessengerService;
import com.kh.groubear.jsh.Messenger.model.vo.Chat;
import com.kh.groubear.jsh.Messenger.model.vo.ChatRead;
import com.kh.groubear.jsh.Messenger.model.vo.ChatView;
import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
import com.kh.groubear.jsh.Messenger.model.vo.StateMessage;
import com.kh.groubear.member.model.vo.Member;

@Controller
public class MessengerController implements HandlerInterceptor {

	@Autowired
	private MessengerService messengerService;

	@RequestMapping("messengerHome.msg")
	public String messengerHome(HttpSession session,
			@RequestParam(value = "q1", required = false, defaultValue = "") String q,
			@RequestParam(value = "toEmpNo", required = false, defaultValue = "") String toEmpNo,
			@RequestParam(value = "chatNo", required = false, defaultValue = "") String chatNo,
			Model model,
			HttpServletResponse response, HttpServletRequest request) throws NumberFormatException, IOException {
		System.out.println("======================= toempNo :" + toEmpNo);
		// ======= 회원 목록
		Member user = (Member) session.getAttribute("loginUser");

		MemberMsg me = messengerService.loginMember(user);

		HashMap<String, Object> map = new HashMap<String, Object>();
		String query = "%" + q + "%";
		map.put("query", query);

		ArrayList<MemberMsg> emp = messengerService.memberList(map);
		model.addAttribute("emp", emp);
		model.addAttribute("me", me);
		ArrayList<ChatRead> chatRead = getUnreadChat(me.getEmpNO());
		
		System.out.println("===== chatRead : " + chatRead);
		
		model.addAttribute("chatRead", chatRead);
		MemberMsg toEmp = null;
		if (!toEmpNo.equals("") && toEmpNo != null) {
			toEmp = messengerService.selectEmp(Integer.parseInt(toEmpNo));
		}

		ArrayList<ChatView> chatList = null;
		if (!chatNo.equals("") && chatNo != null) {
			chatList = getChatListById(me.getEmpNO(), Integer.parseInt(toEmpNo), Integer.parseInt(chatNo));
		}

		

		model.addAttribute("chatList", chatList);
		model.addAttribute("toEmp", toEmp);
		return "jsh/messenger/messengerHome";

		// =====

	}

	@RequestMapping("updateStateMessage.msg")
	public String updateStateMessage(StateMessage stateMessage, Model model) {
		System.out.println("stateMessge : " + stateMessage);

		if (stateMessage.getStateMessageNo() == 0) {

			messengerService.insertStateMessage(stateMessage);

		} else {
			messengerService.updateStateMessage(stateMessage);
		}

		return "redirect:messengerHome.msg";

	}

	public ArrayList<ChatView> getChatListById(int empNO, int toEmpNo, int chatNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNO", empNO);
		map.put("toEmpNo", toEmpNo);
		map.put("chatNo", chatNo);

		ArrayList<ChatView> chatList = messengerService.getChatListById(map);

		return chatList;

	}

	public ArrayList<ChatView> getChatListByRecent(int empNO, int toEmpNo, int number) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNO", empNO);
		map.put("toEmpNo", toEmpNo);
		map.put("number", number);

		ArrayList<ChatView> chatList = messengerService.getChatListByRecent(map);

		return chatList;

	}

	@RequestMapping(value = "submit.msg")
	public void submit(@RequestParam("empNO") int empNO, @RequestParam("toEmpNo") int toEmpNo,
			@RequestParam(value = "message", required = false, defaultValue = "") String message) {

		System.out.println("======== message :" + message);
		if (!message.equals("") && message != null) {
			System.out.println("======== message :" + message);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("empNO", empNO);
			map.put("toEmpNo", toEmpNo);
			map.put("message", message);

			int result = messengerService.submit(map);

		}

	}

	public String getTen(int empNO, int toEmpNo, int number) {

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNO", empNO);
		map.put("toEmpNo", toEmpNo);
		map.put("number", number);
		ArrayList<ChatView> chatList = messengerService.getChatListByRecent(map);
		if(chatList.size() > 0) {
			int value = 0;
			for (int i = chatList.size(); i > 0; i--) {
				int chatTime = Integer.parseInt(chatList.get(value).getCreateDate().substring(11,13));
				System.out.println(chatList.get(value));
				String timeType = "오전";
				if(chatTime >= 12) {
					timeType = "오후";
					chatTime -= 12;
				}
				chatList.get(value).setCreateDate(chatList.get(value).getCreateDate().substring(0,11) + " " + timeType + " " + chatTime + ":" + chatList.get(value).getCreateDate().substring(14,16) + "");
				value++;
			}
		}
		System.out.println("=========== chatList" + chatList);
		if (chatList.size() == 0)
			return "";
		for (int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getEmpName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getToEmpName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getMessage() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getCreateDate() + "\"}]");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}");
		readChat(empNO, toEmpNo);
		if(chatList.get(chatList.size() - 1).getChatNo() == number ) return "";
		return result.toString();
	}

	public String getID(int empNO, int toEmpNo, int chatNo) {

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNO", empNO);
		map.put("toEmpNo", toEmpNo);
		map.put("chatNo", chatNo);
		ArrayList<ChatView> chatList = messengerService.getChatListById(map);
		if(chatList.size() > 0) {
			int value = 0;
			for (int i = chatList.size(); i > 0; i--) {
				int chatTime = Integer.parseInt(chatList.get(value).getCreateDate().substring(11,13));
				String timeType = "오전";
				if(chatTime >= 12) {
					timeType = "오후";
					chatTime -= 12;
				}
				chatList.get(value).setCreateDate(chatList.get(value).getCreateDate().substring(0,11) + " " + timeType + " " + chatTime + ":" + chatList.get(value).getCreateDate().substring(14,16) + "");
				value++;
			}
		}
		if (chatList.size() == 0)
			return "";
		for (int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getEmpName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getToEmpName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getMessage() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getCreateDate() + "\"}]");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatNo() + "\"}");
		
		return result.toString();
	}

	@ResponseBody
	@RequestMapping(value="chatListFunction.msg", produces = "application/json;charset=utf8")
	public String chatListFunction(HttpServletResponse response, @RequestBody String param) {

		System.out.println("=========== 연결 ====================");
		response.setContentType("text/html;charset=UTF-8");

		// 뷰단으로부터 입력확인

		// 입력데이터 map으로 변환
		System.out.println("=======param :" + param);
		Map<String, String> inputMap = paramMap(param);
		
		System.out.println("========inputMap : " + inputMap);
		// gson객체 생성, json화 시켜서 리턴하기 위한 list 생성
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		List<String> returnList = new ArrayList<String>();
		
		String empNO = inputMap.get("empNO");
		String toEmpNo = inputMap.get("toEmpNo");
		String num = inputMap.get("num");
		
		
		System.out.println("========num :" + Integer.parseInt(num));
		System.out.println("========toEmpNo :" + toEmpNo);
		System.out.println("========empNO :" + empNO);
		String result ="";
		if (Integer.parseInt(num) != 0 && !toEmpNo.equals("") && toEmpNo != null) {
			System.out.println("========num2 :" + num);
			result = getTen( Integer.parseInt(empNO), Integer.parseInt(toEmpNo), Integer.parseInt(num));
		}
		System.out.println("========================= : " +gson.toJson(result));
		return gson.toJson(result);

	}

	public HashMap<String, String> paramMap(Object object ){
		HashMap<String, String> hashmap = new HashMap<String, String>();
		JSONObject json = new JSONObject(String.valueOf(object)); // 받아온 string을 json 으로 변환
		System.out.println("===== json :" + json);
		Iterator i = json.keys(); // json key 요소읽어옴
		System.out.println("===== i :" + i);
		while(i.hasNext()){
		     String k = i.next().toString(); // key 순차적으로 추출
		     hashmap.put(k, json.getString(k)); // key, value를 map에 삽입
		}
		
		return hashmap;
	}

	public int readChat(int empNO, int toEmpNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNO", empNO);
		map.put("toEmpNo", toEmpNo);
		int result = messengerService.readChat(map);
		return result;
		
	}
	public ArrayList<ChatRead> getUnreadChat(int empNO) {
		ArrayList<ChatRead> result = messengerService.getUnreadChat(empNO);
		return result;
		
	}
}
