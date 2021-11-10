package com.kh.groubear.jsh.Messenger.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.jsh.Messenger.model.vo.ChatRead;
import com.kh.groubear.jsh.Messenger.model.vo.ChatView;
import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
import com.kh.groubear.jsh.Messenger.model.vo.StateMessage;
import com.kh.groubear.member.model.vo.Member;

@Repository
public class MessengerDao {

	public ArrayList<MemberMsg> memberList(SqlSessionTemplate sqlSession, HashMap<String, Object> map1) {
		// TODO Auto-generated method stub
		System.out.println("===============memberDao==============");
		return (ArrayList)sqlSession.selectList("messengerMapper.memberList", map1);
		
	}

	public MemberMsg loginMember(SqlSessionTemplate sqlSession, Member user) {
		// TODO Auto-generated method stub
		return (MemberMsg)sqlSession.selectOne("messengerMapper.loginMember", user);
	}

	public int updateStateMessage(SqlSessionTemplate sqlSession, StateMessage stateMessage) {
		// TODO Auto-generated method stub
		return sqlSession.update("messengerMapper.updateStateMessage", stateMessage);
	}




	public int insertStateMessage(SqlSessionTemplate sqlSession, StateMessage stateMessage) {
		return sqlSession.insert("messengerMapper.insertStateMessage", stateMessage);
	}






	public MemberMsg selectEmp(SqlSessionTemplate sqlSession, int toEmpNo) {
		// TODO Auto-generated method stub
		return (MemberMsg)sqlSession.selectOne("messengerMapper.selectEmp", toEmpNo);
	}

	public ArrayList<ChatView> getChatListById(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("messengerMapper.getChatListById", map);
	}

	public ArrayList<ChatView> getChatListByRecent(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("messengerMapper.getChatListByRecent", map);
	}

	public int submit(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("messengerMapper.submit", map);
	}

	public int readChat(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("messengerMapper.readChat", map);
	}




	public ArrayList<ChatRead> getUnreadChat(SqlSessionTemplate sqlSession, int empNO) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("messengerMapper.getUnreadChat", empNO);
	}

	

}
