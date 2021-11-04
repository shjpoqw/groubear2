package com.kh.groubear.kms.car.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.groubear.kms.car.model.vo.ReserveCar;

public class CarDao {

	public static int insertReserve(SqlSessionTemplate sqlSession, ReserveCar rc) {
		int result = sqlSession.insert("carMapper.insertCar",rc);
		System.out.println("결과는 ? :" +result);
		return result;
	}

	public static ArrayList<ReserveCar> selectDate(SqlSessionTemplate sqlSession, ReserveCar date) {
		
		return (ArrayList)sqlSession.selectList("carMapper.selectCar", date);
	}

	public static int updateReserve(SqlSessionTemplate sqlSession, ReserveCar rc) {
		int result=sqlSession.update("carMapper.updateCar",rc);
		return result;
	}

	public static int deleteReserve(SqlSessionTemplate sqlSession, ReserveCar rc) {
		int result=sqlSession.update("carMapper.deleteCar",rc);
		return result;
	}

}
