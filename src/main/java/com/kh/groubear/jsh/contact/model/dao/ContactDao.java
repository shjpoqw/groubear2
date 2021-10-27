package com.kh.groubear.jsh.contact.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.jsh.contact.model.vo.Contact;

@Repository
public class ContactDao {

	public ArrayList<Contact> selectList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("contactMapper.selectList", map);
	}

	public int insertContact(SqlSessionTemplate sqlSession, Contact c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("contactMapper.insertContact", c);
	}


	public int updateContact(SqlSessionTemplate sqlSession, Contact c) {
		// TODO Auto-generated method stub
		return sqlSession.update("contactMapper.updateContact", c);
	}

	public int deleteContact(SqlSessionTemplate sqlSession, int deleteNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("contactMapper.deleteContact", deleteNo);
	}

	public int countContact(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("contactMapper.countContact");
	}
	

}
