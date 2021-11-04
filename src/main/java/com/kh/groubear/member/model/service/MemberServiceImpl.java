package com.kh.groubear.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.groubear.common.exception.CommException;
import com.kh.groubear.member.model.dao.MemberDao;
import com.kh.groubear.member.model.vo.Department;
import com.kh.groubear.member.model.vo.EmpAttachment;
import com.kh.groubear.member.model.vo.Job;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member loginMember(Member m) throws Exception {

		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		if(loginUser == null) {
			throw new Exception("loginUser 확인");
		}
		
		return loginUser;
	}

	@Override
	public void insertMember(Member m) {
		
		int result = memberDao.insertMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회원가입에 실패하였습니다."); //이렇게 하면 위 메소드처럼 throws Exception 안해도 됨
		}
		
	}

	@Override
	public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		if(loginUser == null) {
			throw new CommException("loginUser 확인");
		}
		
		if(!bCryptPasswordEncoder.matches(m.getEmpPwd(), loginUser.getEmpPwd())) {
			throw new CommException("암호 불일치!!!");
		}
		
		return loginUser;
	}

	@Override
	public Member updateMember(Member m) throws Exception {
		
		int result = memberDao.updateMember(sqlSession, m);

		if(result < 0) {

			throw new Exception("회원수정에 실패하였습니다.");

		} else {
			Member loginUser = memberDao.loginMember(sqlSession, m);
			return loginUser;
		}
	}

	@Override
	public void deleteMember(String userId) {
		
		int result = memberDao.deleteMember(sqlSession, userId);
		
		if(result < 0) {
			throw new CommException("회원탈퇴에 실패하였습니다.");
		}
		
	}

	@Override
	public ArrayList<Job> selectJob() {
		ArrayList<Job> job = memberDao.selectJob(sqlSession);
		return job;
	}

	@Override
	public ArrayList<Department> selectDept() {
		ArrayList<Department> dept = memberDao.selectDept(sqlSession);
		return dept;
	}

	

	

	@Override
	public ArrayList<MemberView> contactSelectList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return memberDao.contactSelectList(sqlSession,map);
	}

	
	@Override
	public int countMember() {
		int result = memberDao.countMember(sqlSession);
		return result;
	}

	
	@Override
	public EmpAttachment selectProfile(int empNO) {
		EmpAttachment profile = memberDao.selectProfile(sqlSession, empNO);
		if(profile == null) {
			profile = new EmpAttachment();
		}
		return profile;
	}

	@Override
	public void insertProfile(EmpAttachment file) {
		int result = memberDao.insertProfile(sqlSession, file);

		if (result < 0) {
			throw new CommException("파일등록 실패."); 
		}

	}

	@Override
	public void updateProfile(EmpAttachment file) {
		int result = memberDao.updateProfile(sqlSession, file);

		if (result < 0) {
			throw new CommException("파일등록 실패."); 
		}
		
	}


}
