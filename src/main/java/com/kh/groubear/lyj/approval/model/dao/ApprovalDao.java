package com.kh.groubear.lyj.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.lyj.approval.model.vo.Approval;
import com.kh.groubear.lyj.approval.model.vo.ApprovalForm;
import com.kh.groubear.lyj.approval.model.vo.PageInfo;

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

	public int selectSentListCount(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectSentListCount", eno);
	}

	public ArrayList<Approval> selectSentList(SqlSessionTemplate sqlSession, PageInfo pi, int eno) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSentList", null, rowBounds);
	}

	public int selectReceivedListCount(SqlSessionTemplate sqlSession, int mNo, int fNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("approvalMapper.selectReceivedListCount", mNo);
	}

	public ArrayList<Approval> selectReceivedList(SqlSessionTemplate sqlSession, PageInfo pi, int mNo, int fNo) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectReceivedList", null, rowBounds);
	}

}
