package com.kh.groubear.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.member.model.vo.Department;
import com.kh.groubear.member.model.vo.EmpAttachment;
import com.kh.groubear.member.model.vo.Job;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public ArrayList<Job> selectJob(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectJob");
	}

	public ArrayList<Department> selectDept(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectDept");
	}

	public ArrayList<MemberView> contactSelectList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.contactSelectList", map);
	}

	public int countMember(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.countMember");
	}


	public EmpAttachment selectProfile(SqlSessionTemplate sqlSession, int empNO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectProfile", empNO);
	}

	public int insertProfile(SqlSessionTemplate sqlSession, EmpAttachment file) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertProfile", file);
	}

	public int updateProfile(SqlSessionTemplate sqlSession, EmpAttachment file) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateProfile", file);
	}

	
}
