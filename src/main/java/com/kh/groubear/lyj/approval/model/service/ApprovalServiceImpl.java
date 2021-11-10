package com.kh.groubear.lyj.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.common.exception.CommException;
import com.kh.groubear.lyj.approval.model.dao.ApprovalDao;
import com.kh.groubear.lyj.approval.model.vo.Approval;
import com.kh.groubear.lyj.approval.model.vo.ApprovalForm;
import com.kh.groubear.lyj.approval.model.vo.PageInfo;
import com.kh.groubear.lyj.approval.model.vo.Reply;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao approvalDao;

	@Override
	public int selectFormListCount() {
		return approvalDao.selectFormListCount(sqlSession);
	}

	@Override
	public ArrayList<ApprovalForm> selectFormList(PageInfo pi) {
		return approvalDao.selectFormList(sqlSession, pi);
	}

	@Override
	public ApprovalForm selectForm(int ano) {
		ApprovalForm af = approvalDao.selectForm(sqlSession, ano);
		
		return af;
	}

	@Override
	public void insertApproval(Approval a) {
		int result = approvalDao.insertApproval(sqlSession, a);
		
		if(result < 0) {
			throw new CommException("문서 작성 실패");
		}
		
	}

	@Override
	public int selectSentListCount(int eno) {
		return approvalDao.selectSentListCount(sqlSession, eno);
	}

	@Override
	public ArrayList<Approval> selectSentList(PageInfo pi, int eno) {
		return approvalDao.selectSentList(sqlSession, pi, eno);
	}
	
	@Override
	public Approval selectApproval(int ano) {
		return approvalDao.selectApproval(sqlSession, ano);
	}
	
	@Override
	public void updateStatus(int ano, int status) {
		int result = approvalDao.updateStatus(sqlSession, ano, status);
		
		if(result < 0) {
			throw new CommException("updateStatus 실패");
		}
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(int ano) {
		return approvalDao.selectReplyList(sqlSession, ano);
	}

	@Override
	public int insertReply(Reply r) {
		int result = approvalDao.insertReply(sqlSession, r);
		
		if(result < 0) {
			throw new CommException("insertReply 실패");
		}
		
		return result;
	}

	@Override
	public int selectReceivedListCount(int eno) {
		return approvalDao.selectReceivedListCount(sqlSession, eno);
	}

	@Override
	public ArrayList<Approval> selectReceivedList(PageInfo pi, int eno) {
		return approvalDao.selectReceivedList(sqlSession, pi, eno);
	}

	@Override
	public int selectTempSentListCount(int eno) {
		return approvalDao.selectTempSentListCount(sqlSession, eno);
	}

	@Override
	public ArrayList<Approval> selectTempSentList(PageInfo pi, int eno) {
		return approvalDao.selectTempSentList(sqlSession, pi, eno);
	}

	@Override
	public void updateApproval(Approval a) {
		int result = approvalDao.updateApproval(sqlSession, a);
		
		if(result < 0) {
			throw new CommException("updateApproval 실패");
		}
	}
	
	// Member 관련	
	/*
	@Override
	public ArrayList<Member> selectMemberList() {
		return approvalDao.selectMemberList(sqlSession);
	}

	@Override
	public MemberView selectMEmp(int ano, int mno) {
		return approvalDao.selectMEmp(sqlSession, ano, mno);
	}

	@Override
	public MemberView selectFEmp(int ano, int fno) {
		return approvalDao.selectFEmp(sqlSession, ano, fno);
	}

	@Override
	public MemberView selectWEmp(int ano, int wno) {
		return approvalDao.selectWEmp(sqlSession, ano, wno);
	}
	*/

}
