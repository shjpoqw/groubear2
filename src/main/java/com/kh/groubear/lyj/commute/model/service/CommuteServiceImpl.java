package com.kh.groubear.lyj.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.common.exception.CommException;
import com.kh.groubear.lyj.commute.model.dao.CommuteDao;
import com.kh.groubear.lyj.commute.model.vo.Commute;
import com.kh.groubear.lyj.commute.model.vo.Leave;

@Service
public class CommuteServiceImpl implements CommuteService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CommuteDao commuteDao;

	@Override
	public int selectCommuteCount(int eno) {
		return commuteDao.selectCommuteCount(sqlSession, eno);
	}

	@Override
	public void insertStart(int eno) {
		int result = commuteDao.insertStart(sqlSession, eno);
		
		if(result < 0) {
			throw new CommException("출근 기록 실패");
		}
	}

	@Override
	public void updateEnd(int eno) {
		int result = commuteDao.updateEnd(sqlSession, eno);
		
		if(result < 0) {
			throw new CommException("퇴근 기록 실패");
		}
	}

	@Override
	public Commute selectCommute(int eno) {
		Commute c = commuteDao.selectCommute(sqlSession, eno);
		
		return c;
	}

	@Override
	public ArrayList<Commute> selectCommuteList(int eno, String startDate, String endDate) {
		return commuteDao.selectCommuteList(sqlSession, eno, startDate, endDate);
	}

	@Override
	public ArrayList<Commute> selectCommuteAllList(int eno, String startDate, String endDate) {
		return commuteDao.selectCommuteAllList(sqlSession, eno, startDate, endDate);
	}

	@Override
	public void insertLeave(int empNo) {
		int result = commuteDao.insertLeave(sqlSession, empNo);
		
		if(result < 0) {
			throw new CommException("연차 생성 실패");
		}
	}

	@Override
	public ArrayList<Leave> selectLeaveUseList(int eno) {
		return commuteDao.selectLeaveUseList(sqlSession, eno);
	}

	@Override
	public ArrayList<Leave> selectLeaveCreateList(int eno) {
		return commuteDao.selectLeaveCreateList(sqlSession, eno);
	}

	@Override
	public void updateLeave(String leaveUseDate, int eno) {
		int result = commuteDao.updateLeave(sqlSession, leaveUseDate, eno);
		
		if(result < 0) {
			throw new CommException("updateLeave 실패");
		}
	}

}
