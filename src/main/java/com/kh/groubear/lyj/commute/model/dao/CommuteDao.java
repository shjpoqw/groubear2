package com.kh.groubear.lyj.commute.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.lyj.commute.model.vo.Commute;
import com.kh.groubear.lyj.commute.model.vo.Leave;

@Repository
public class CommuteDao {

	public int selectCommuteCount(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("commuteMapper.selectCommuteCount", eno);
	}

	public int insertStart(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.insert("commuteMapper.insertStart", eno);
	}

	public int updateEnd(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.update("commuteMapper.updateEnd", eno);
	}

	public Commute selectCommute(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("commuteMapper.selectCommute", eno);
	}

	public ArrayList<Commute> selectCommuteList(SqlSessionTemplate sqlSession, int eno, String startDate, String endDate) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("eno", eno);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.selectCommuteList", map);
	}

	public ArrayList<Commute> selectCommuteAllList(SqlSessionTemplate sqlSession, int eno, String startDate,
			String endDate) {
		Map map = new HashMap();
		map.put("eno", eno);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.selectCommuteAllList", map);
	}

	public int insertLeave(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("commuteMapper.insertLeave", empNo);
	}

	public ArrayList<Leave> selectLeaveUseList(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("commuteMapper.selectLeaveUseList", eno);
	}

	public ArrayList<Leave> selectLeaveCreateList(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("commuteMapper.selectLeaveCreateList", eno);
	}

	public int updateLeave(SqlSessionTemplate sqlSession, String leaveUseDate, int eno) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("leaveUseDate", leaveUseDate);
		map.put("eno", eno);
		
		return sqlSession.update("commuteMapper.updateLeave", map);
	}

	

}
