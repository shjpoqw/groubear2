package com.kh.groubear.jsh.contact.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.groubear.jsh.contact.model.vo.Contact;
import com.kh.groubear.member.model.vo.Member;

public interface ContactService {

	ArrayList<Contact> selectList(HashMap<String, Object> map);

	void insertContact(Contact c);


	void updateContact(Contact c);

	void deleteContact(int deleteNo);

	int countContact();
	
	
}
