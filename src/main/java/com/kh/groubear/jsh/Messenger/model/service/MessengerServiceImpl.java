package com.kh.groubear.jsh.Messenger.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.jsh.Messenger.model.dao.MessengerDao;
import com.kh.groubear.jsh.Messenger.model.vo.Chat;
import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
import com.kh.groubear.jsh.Messenger.model.vo.Messenger;
import com.kh.groubear.jsh.Messenger.model.vo.StateMessage;
import com.kh.groubear.member.model.vo.Member;

@Service
public class MessengerServiceImpl implements MessengerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MessengerDao messengerDao;
	
	
	@Override
	public ArrayList<MemberMsg> memberList(HashMap<String, Object> map1) {
		ArrayList<MemberMsg> emp = messengerDao.memberList(sqlSession, map1);
		return emp;
	}


	@Override
	public MemberMsg loginMember(Member user) {
		MemberMsg me = (MemberMsg)messengerDao.loginMember(sqlSession, user);
		return me;
	}


	@Override
	public void updateStateMessage(StateMessage stateMessage) {
		int result = messengerDao.updateStateMessage(sqlSession, stateMessage);
	}


	@Override
	public ArrayList<Messenger> msgList(HashMap<String, Object> map3) {
		ArrayList<Messenger> msgList = messengerDao.msgList(sqlSession, map3);
		return msgList;
	}


	@Override
	public void insertMsg(Messenger insertMsg) {
		int result = messengerDao.insertMsg(sqlSession, insertMsg);
	}


	@Override
	public void insertStateMessage(StateMessage stateMessage) {
		int result = messengerDao.insertStateMessage(sqlSession, stateMessage);
	}


	@Override
	public ArrayList<Messenger> selectMsgList(HashMap<String, Object> map2) {
		ArrayList<Messenger> selectMsgList = messengerDao.selectMsgList(sqlSession, map2);
		return selectMsgList;
	}


	@Override
	public ArrayList<Chat> chatList(HashMap<String, Object> map) {
		ArrayList<Chat> chatList = messengerDao.chatList(sqlSession, map);
		
		return chatList;
	}


	@Override
	public ArrayList<Chat> chatListRecent(HashMap<String, Object> map) {
		ArrayList<Chat> chatListRecent = messengerDao.chatListRecent(sqlSession, map);
		
		return chatListRecent;
	}


	@Override
	public void transmit(HashMap<String, Object> map) {
		int result = messengerDao.transmit(sqlSession, map);
	}


	@Override
	public MemberMsg selectEmp(int toEmpNo) {
		MemberMsg selectEmp = messengerDao.selectEmp(sqlSession, toEmpNo);
		return selectEmp;
	}


	@Override
	public int sendMessage(Chat chat) {
		// TODO Auto-generated method stub
		return 0;
	}

}
