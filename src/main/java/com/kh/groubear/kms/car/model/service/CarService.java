package com.kh.groubear.kms.car.model.service;

import java.util.ArrayList;

import com.kh.groubear.kms.car.model.vo.ReserveCar;

public interface CarService {

	void insertReserve(ReserveCar rc);

	ArrayList<ReserveCar> selectDate(ReserveCar date);

	void updateReserve(ReserveCar rc);

	void deleteReserve(ReserveCar rc);

}
