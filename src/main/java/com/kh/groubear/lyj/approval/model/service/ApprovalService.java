package com.kh.groubear.lyj.approval.model.service;

import java.util.ArrayList;

import com.kh.groubear.lyj.approval.model.vo.Approval;
import com.kh.groubear.lyj.approval.model.vo.ApprovalForm;
import com.kh.groubear.lyj.approval.model.vo.PageInfo;

public interface ApprovalService {

	int selectFormListCount();

	ArrayList<ApprovalForm> selectFormList(PageInfo pi);

	ApprovalForm selectForm(int ano);

	int selectSentListCount(int eno);

	ArrayList<Approval> selectSentList(PageInfo pi, int eno);

	int selectReceivedListCount(int mNo, int fNo);

	ArrayList<Approval> selectReceivedList(PageInfo pi, int mNo, int fNo);

}
