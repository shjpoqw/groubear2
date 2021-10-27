package com.kh.groubear.jsh.Messenger.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.jsh.Messenger.model.vo.MemberMsg;
import com.kh.groubear.jsh.Messenger.model.vo.Messenger;
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

	public ArrayList<Messenger> msgList(SqlSessionTemplate sqlSession, HashMap<String, Object> map3) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("messengerMapper.msgList", map3);
	}

	public int insertMsg(SqlSessionTemplate sqlSession, Messenger insertMsg) {
		return sqlSession.insert("messengerMapper.insertMsg", insertMsg);
	}

	

}
