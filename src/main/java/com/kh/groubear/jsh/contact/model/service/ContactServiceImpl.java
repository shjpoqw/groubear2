package com.kh.groubear.jsh.contact.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.common.exception.CommException;
import com.kh.groubear.jsh.contact.model.dao.ContactDao;
import com.kh.groubear.jsh.contact.model.vo.Contact;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ContactDao contactDao;

	@Override
	public ArrayList<Contact> selectList(HashMap<String, Object> map) {
		ArrayList<Contact> list = contactDao.selectList(sqlSession, map);
		return list;
	}

	@Override
	public void insertContact(Contact c) {

		int result = contactDao.insertContact(sqlSession, c);

		if (result < 0) {
			throw new CommException("주소록 등록 실패");
		}

	}

	@Override
	public void updateContact(Contact c) {
		int result = contactDao.updateContact(sqlSession, c);

		if (result < 0) {
			throw new CommException("주소록 수정 실패");
		}
	}

	@Override
	public void deleteContact(int deleteNo) {
		int result = contactDao.deleteContact(sqlSession, deleteNo);

		if (result < 0) {
			throw new CommException("주소록 삭제 실패");
		}
		
	}

	@Override
	public int countContact() {
		int result = contactDao.countContact(sqlSession);
		return result;
	}
}
