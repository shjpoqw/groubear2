package com.kh.groubear.lyj.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.lyj.approval.model.vo.Approval;
import com.kh.groubear.lyj.approval.model.vo.ApprovalForm;
import com.kh.groubear.lyj.approval.model.vo.PageInfo;
import com.kh.groubear.lyj.approval.model.vo.Reply;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;

@Repository
public class ApprovalDao {

	public int selectFormListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectFormListCount");
	}

	public ArrayList<ApprovalForm> selectFormList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectFormList", null, rowBounds);
	}

	public ApprovalForm selectForm(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectForm", ano);
	}

	public int insertApproval(SqlSessionTemplate sqlSession, Approval a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertApproval", a);
	}

	public int selectSentListCount(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectSentListCount", eno);
	}

	public ArrayList<Approval> selectSentList(SqlSessionTemplate sqlSession, PageInfo pi, int eno) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSentList", eno, rowBounds);
	}
	
	public Approval selectApproval(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectApproval", ano);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int ano) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectReplyList", ano);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("approvalMapper.insertReply", r);
	}

	public int selectReceivedListCount(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectReceivedListCount", eno);
	}

	public ArrayList<Approval> selectReceivedList(SqlSessionTemplate sqlSession, PageInfo pi, int eno) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectReceivedList", eno, rowBounds);
	}

	public int selectTempSentListCount(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectTempSentListCount", eno);
	}

	public ArrayList<Approval> selectTempSentList(SqlSessionTemplate sqlSession, PageInfo pi, int eno) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTempSentList", eno, rowBounds);
	}

	public int updateApproval(SqlSessionTemplate sqlSession, Approval a) {
		// TODO Auto-generated method stub
		return sqlSession.update("approvalMapper.updateApproval", a);
	}
	
	// Member 관련
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMemberList");
	}

	public MemberView selectMEmp(SqlSessionTemplate sqlSession, int ano, int mno) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("ano", ano);
		map.put("mno", mno);
		
		return sqlSession.selectOne("approvalMapper.selectMEmp", map);
	}

	public MemberView selectFEmp(SqlSessionTemplate sqlSession, int ano, int fno) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("ano", ano);
		map.put("fno", fno);
		
		return sqlSession.selectOne("approvalMapper.selectFEmp", map);
	}
	
	public MemberView selectWEmp(SqlSessionTemplate sqlSession, int ano, int wno) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("ano", ano);
		map.put("wno", wno);
		
		return sqlSession.selectOne("approvalMapper.selectWEmp", map);
	}

}
