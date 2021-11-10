package com.kh.groubear.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.member.model.vo.Department;
import com.kh.groubear.member.model.vo.EmpAttachment;
import com.kh.groubear.member.model.vo.Job;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;
import com.kh.groubear.member.model.vo.PageInfo;

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

	public ArrayList<MemberView> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds row = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectList",null,row);
	}

	public ArrayList<MemberView> searchJob(SqlSessionTemplate sqlSession, PageInfo pi, String search) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds row = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.searchJob",null,row);
	}

	public ArrayList<MemberView> searchEmp(SqlSessionTemplate sqlSession, PageInfo pi, String search) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds row = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.searchEmp",null,row);
	}

	public ArrayList<MemberView> searchDept(SqlSessionTemplate sqlSession, PageInfo pi, String search) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds row = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.searchDept",null,row);
	}

	public ArrayList<MemberView> selectList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> searchMap) {
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds row = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.searchList",searchMap,row);
	}

	public MemberView selectMember(SqlSessionTemplate sqlSession,int empNo) {
		
		return sqlSession.selectOne("memberMapper.selectMember",empNo);
	}

	public int updateMember2(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.update("memberMapper.updateMember2",member);
	}

	public int deleteMember2(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.update("memberMapper.deleteMember2", empId);
	}

	public Member adminLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.adminLogin", m);
	}
	// approval commute 관련
	   public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
	      // TODO Auto-generated method stub
	      return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList");
	   }

	   public MemberView selectMEmp(SqlSessionTemplate sqlSession, int ano, int mno) {
	      // TODO Auto-generated method stub
	      Map map = new HashMap();
	      map.put("ano", ano);
	      map.put("mno", mno);
	      
	      return sqlSession.selectOne("memberMapper.selectMEmp", map);
	   }

	   public MemberView selectFEmp(SqlSessionTemplate sqlSession, int ano, int fno) {
	      // TODO Auto-generated method stub
	      Map map = new HashMap();
	      map.put("ano", ano);
	      map.put("fno", fno);
	      
	      return sqlSession.selectOne("memberMapper.selectFEmp", map);
	   }
	   
	   public MemberView selectWEmp(SqlSessionTemplate sqlSession, int ano, int wno) {
	      // TODO Auto-generated method stub
	      Map map = new HashMap();
	      map.put("ano", ano);
	      map.put("wno", wno);
	      
	      return sqlSession.selectOne("memberMapper.selectWEmp", map);
	   }
	
}
