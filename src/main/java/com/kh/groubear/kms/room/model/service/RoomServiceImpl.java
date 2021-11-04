package com.kh.groubear.kms.room.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.common.exception.CommException;
import com.kh.groubear.kms.room.model.dao.RoomDao;
import com.kh.groubear.kms.room.model.vo.ReserveRoom;

@Service
public class RoomServiceImpl implements RoomService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private RoomDao RoomDao;

	@Override
	public int selectName(String empName) throws Exception {

		int result = RoomDao.selectEmpId(sqlSession, empName);

		if (result < 1) {
			throw new Exception("loginUser 확인");
		}

		return result;
	}

	@Override
	public void insertReserve(ReserveRoom rr) {
		int result = RoomDao.insertReserve(sqlSession, rr);

		if (result < 1) {
			throw new CommException("일정 등록 실패하였습니다.");
		}
	}

	@Override
	public ArrayList<ReserveRoom> selectDate(ReserveRoom date) {
		ArrayList<ReserveRoom> rr = RoomDao.selectDate(sqlSession, date);

		return rr;
	}

	@Override
	public void updateReserve(ReserveRoom rr) {
		int result = RoomDao.updateReserve(sqlSession, rr);

		if (result < 1) {
			throw new CommException("일정 수정 실패하였습니다.");
		}
	}

	@Override
	public void deleteReserve(ReserveRoom rr) {
		// TODO Auto-generated method stub
		int result = RoomDao.deleteReserve(sqlSession, rr);

		if (result < 1) {
			throw new CommException("일정 삭제 실패하였습니다.");

		}

	}

}
