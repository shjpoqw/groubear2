package com.kh.groubear.jsh.Messenger.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.jsh.Messenger.model.dao.MessengerDao;
import com.kh.groubear.jsh.Messenger.model.vo.ChatRead;
import com.kh.groubear.jsh.Messenger.model.vo.ChatView;
import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
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
		MemberMsg me = (MemberMsg) messengerDao.loginMember(sqlSession, user);
		return me;
	}

	@Override
	public void updateStateMessage(StateMessage stateMessage) {
		int result = messengerDao.updateStateMessage(sqlSession, stateMessage);
	}

	@Override
	public void insertStateMessage(StateMessage stateMessage) {
		int result = messengerDao.insertStateMessage(sqlSession, stateMessage);
	}

	@Override
	public MemberMsg selectEmp(int toEmpNo) {
		MemberMsg selectEmp = messengerDao.selectEmp(sqlSession, toEmpNo);
		return selectEmp;
	}

	@Override
	public ArrayList<ChatView> getChatListById(HashMap<String, Object> map) {
		ArrayList<ChatView> chatList = messengerDao.getChatListById(sqlSession, map);
		return chatList;
	}

	@Override
	public ArrayList<ChatView> getChatListByRecent(HashMap<String, Object> map) {
		ArrayList<ChatView> chatList = messengerDao.getChatListByRecent(sqlSession, map);
		return chatList;
	}

	@Override
	public int submit(HashMap<String, Object> map) {
		int result = messengerDao.submit(sqlSession, map);

		return result;
	}

	@Override
	public int readChat(HashMap<String, Object> map) {
		int result = messengerDao.readChat(sqlSession, map);

		return result;
	}





	@Override
	public ArrayList<ChatRead> getUnreadChat(int empNO) {
		ArrayList<ChatRead> result = messengerDao.getUnreadChat(sqlSession, empNO);
		return result;
	}

}
