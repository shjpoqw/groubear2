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
import com.kh.groubear.member.model.vo.PageInfo;


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
		Member loginUser;
		if(m.getEmpId().equals("admin")) {
			loginUser = memberDao.adminLogin(sqlSession, m);
		}else {
			loginUser =  memberDao.loginMember(sqlSession, m);
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

	@Override
	public ArrayList<MemberView> selectList(PageInfo pi) {
		
		return memberDao.selectList(sqlSession,pi);
	}

	@Override
	public ArrayList<MemberView> searchList(PageInfo pi, HashMap<String, String> searchMap) {
		
		return memberDao.selectList(sqlSession,pi,searchMap);
	}



	@Override
	public MemberView selectMember(int empNo) {
		// TODO Auto-generated method stub
		return memberDao.selectMember(sqlSession,empNo);
	
	}

	@Override
	public MemberView updateMember2(Member member) throws Exception {
		
		int result = memberDao.updateMember2(sqlSession, member);

		if(result < 0) {

			throw new Exception("회원수정에 실패하였습니다.");

		} else {
			MemberView mv = memberDao.selectMember(sqlSession, member.getEmpNO());
			return mv;
		}
	}

	@Override
	public void deleteMember2(String empId) {
		
	int result = memberDao.deleteMember2(sqlSession, empId);
		
		if(result < 0) {
			throw new CommException("회원탈퇴에 실패하였습니다.");
		}
		
	}

	// approval commute 관련
	   @Override
	   public ArrayList<Member> selectMemberList() {
	      return memberDao.selectMemberList(sqlSession);
	   }

	   @Override
	   public MemberView selectMEmp(int ano, int mno) {
	      return memberDao.selectMEmp(sqlSession, ano, mno);
	   }

	   @Override
	   public MemberView selectFEmp(int ano, int fno) {
	      return memberDao.selectFEmp(sqlSession, ano, fno);
	   }

	   @Override
	   public MemberView selectWEmp(int ano, int wno) {
	      return memberDao.selectWEmp(sqlSession, ano, wno);
	   }

}
