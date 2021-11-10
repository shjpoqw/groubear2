package com.kh.groubear.lyj.commute.model.service;

import java.util.ArrayList;

import com.kh.groubear.lyj.commute.model.vo.Commute;
import com.kh.groubear.lyj.commute.model.vo.Leave;

public interface CommuteService {

	int selectCommuteCount(int eno);

	void insertStart(int eno);

	void updateEnd(int eno);

	Commute selectCommute(int eno);

	ArrayList<Commute> selectCommuteList(int eno, String startDate, String endDate);

	ArrayList<Commute> selectCommuteAllList(int eno, String startDate, String endDate);

	void insertLeave(int empNo);

	ArrayList<Leave> selectLeaveUseList(int eno);

	ArrayList<Leave> selectLeaveCreateList(int eno);

	void updateLeave(String leaveUseDate, int eno);

}
