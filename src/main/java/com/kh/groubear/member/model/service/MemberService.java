package com.kh.groubear.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.groubear.member.model.vo.Department;
import com.kh.groubear.member.model.vo.Job;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;

public interface MemberService {

	Member loginMember(Member m) throws Exception;

	void insertMember(Member m);

	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	Member updateMember(Member m) throws Exception;

	void deleteMember(String userId);

	ArrayList<Job> selectJob();

	ArrayList<Department> selectDept();


	ArrayList<MemberView> contactSelectList(HashMap<String, Object> map);

	int countMember();



	

	

}
