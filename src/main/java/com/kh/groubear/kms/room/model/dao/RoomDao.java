package com.kh.groubear.kms.room.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.kms.room.model.vo.ReserveRoom;

@Repository
public class RoomDao {

	public int selectEmpId(SqlSessionTemplate sqlSession, String empName) throws Exception {
		return sqlSession.selectOne("memberMapper.selectName", empName);
		
	}

	public int insertReserve(SqlSessionTemplate sqlSession, ReserveRoom rr) {
		int result=sqlSession.insert("roomMapper.insertReserve",rr);
		return result;
	}

	public ArrayList<ReserveRoom> selectDate(SqlSessionTemplate sqlSession, ReserveRoom date) {

		return (ArrayList)sqlSession.selectList("roomMapper.selectDate", date);
	}

	public int updateReserve(SqlSessionTemplate sqlSession, ReserveRoom rr) {
		int result=sqlSession.update("roomMapper.updateReserve",rr);
		return result;
	}

	public int deleteReserve(SqlSessionTemplate sqlSession, ReserveRoom rr) {
		int result=sqlSession.update("roomMapper.deleteReserve",rr);
		return result;
	}

}
