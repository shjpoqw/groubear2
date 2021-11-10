package com.kh.groubear.lyj.approval.model.service;

import java.util.ArrayList;

import com.kh.groubear.lyj.approval.model.vo.Approval;
import com.kh.groubear.lyj.approval.model.vo.ApprovalForm;
import com.kh.groubear.lyj.approval.model.vo.PageInfo;
import com.kh.groubear.lyj.approval.model.vo.Reply;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;

public interface ApprovalService {

	int selectFormListCount();

	ArrayList<ApprovalForm> selectFormList(PageInfo pi);

	ApprovalForm selectForm(int ano);

	void insertApproval(Approval a);

	int selectSentListCount(int eno);

	ArrayList<Approval> selectSentList(PageInfo pi, int eno);
	
	Approval selectApproval(int ano);

	void updateStatus(int ano, int status);

	int insertReply(Reply r);

	ArrayList<Reply> selectReplyList(int ano);

	int selectReceivedListCount(int eno);

	ArrayList<Approval> selectReceivedList(PageInfo pi, int eno);

	int selectTempSentListCount(int eno);

	ArrayList<Approval> selectTempSentList(PageInfo pi, int eno);
	
	void updateApproval(Approval a);
	
	// Member 관련
	/*
	ArrayList<Member> selectMemberList();

	MemberView selectMEmp(int ano, int mNo);

	MemberView selectFEmp(int ano, int fno);

	MemberView selectWEmp(int ano, int wno);
	*/
	
}
