package com.kh.groubear.jsh.Messenger.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.groubear.jsh.Messenger.model.vo.ChatRead;
import com.kh.groubear.jsh.Messenger.model.vo.ChatView;
import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
import com.kh.groubear.jsh.Messenger.model.vo.StateMessage;
import com.kh.groubear.member.model.vo.Member;

public interface MessengerService {

	ArrayList<MemberMsg> memberList(HashMap<String, Object> map1);

	MemberMsg loginMember(Member user);

	void updateStateMessage(StateMessage stateMessage);

	void insertStateMessage(StateMessage stateMessage);

	MemberMsg selectEmp(int toEmpNo);

	

	ArrayList<ChatView> getChatListById(HashMap<String, Object> map);

	ArrayList<ChatView> getChatListByRecent(HashMap<String, Object> map);

	int submit(HashMap<String, Object> map);

	int readChat(HashMap<String, Object> map);


	ArrayList<ChatRead> getUnreadChat(int empNO);


}
