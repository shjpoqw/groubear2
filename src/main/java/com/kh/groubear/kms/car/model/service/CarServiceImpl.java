package com.kh.groubear.kms.car.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.common.exception.CommException;
import com.kh.groubear.kms.car.model.dao.CarDao;
import com.kh.groubear.kms.car.model.vo.ReserveCar;

@Service
public class CarServiceImpl implements CarService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public void insertReserve(ReserveCar rc) {
		int result = CarDao.insertReserve(sqlSession, rc);

		if (result < 1) {
			System.out.println("일정등록실패");
		}
		
	}


	@Override
	public ArrayList<ReserveCar> selectDate(ReserveCar date) {
		ArrayList<ReserveCar> rc = CarDao.selectDate(sqlSession, date);
		return rc;
	}


	@Override
	public void updateReserve(ReserveCar rc) {
		int result = CarDao.updateReserve(sqlSession, rc);

		if (result < 1) {
			throw new CommException("일정 수정 실패하였습니다.");
		}
		
	}


	@Override
	public void deleteReserve(ReserveCar rc) {
		int result = CarDao.deleteReserve(sqlSession, rc);

		if (result < 1) {
			throw new CommException("일정 삭제 실패하였습니다.");

		}
		
	}


	@Override
	public String statusCheck(String type) {
		
		return CarDao.statusCheck(sqlSession,type);
	}

}
