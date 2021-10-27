package com.kh.groubear.lyj.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.lyj.approval.model.dao.ApprovalDao;
import com.kh.groubear.lyj.approval.model.vo.Approval;
import com.kh.groubear.lyj.approval.model.vo.ApprovalForm;
import com.kh.groubear.lyj.approval.model.vo.PageInfo;

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
	public int selectSentListCount(int eno) {
		return approvalDao.selectSentListCount(sqlSession, eno);
	}

	@Override
	public ArrayList<Approval> selectSentList(PageInfo pi, int eno) {
		return approvalDao.selectSentList(sqlSession, pi, eno);
	}

	@Override
	public int selectReceivedListCount(int mNo, int fNo) {
		return approvalDao.selectReceivedListCount(sqlSession, mNo, fNo);
	}

	@Override
	public ArrayList<Approval> selectReceivedList(PageInfo pi, int mNo, int fNo) {
		return approvalDao.selectReceivedList(sqlSession, pi, mNo, fNo);
	}

}
