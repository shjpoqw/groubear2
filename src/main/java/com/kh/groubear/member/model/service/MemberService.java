package com.kh.groubear.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.groubear.member.model.vo.Department;
import com.kh.groubear.member.model.vo.EmpAttachment;
import com.kh.groubear.member.model.vo.Job;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;
import com.kh.groubear.member.model.vo.PageInfo;

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

	EmpAttachment selectProfile(int empNO);

	void insertProfile(EmpAttachment file);

	void updateProfile(EmpAttachment file);

	ArrayList<MemberView> selectList(PageInfo pi);

	ArrayList<MemberView> searchList(PageInfo pi, HashMap<String, String> searchMap);

	MemberView selectMember(int empNo);

	MemberView updateMember2(Member member) throws Exception;

	void deleteMember2(String empId);

	// approval commute 관련
   ArrayList<Member> selectMemberList();

   MemberView selectMEmp(int ano, int mNo);

   MemberView selectFEmp(int ano, int fno);

   MemberView selectWEmp(int ano, int wno);

	




	

	

}
