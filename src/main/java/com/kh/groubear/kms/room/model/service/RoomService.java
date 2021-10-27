package com.kh.groubear.kms.room.model.service;

import java.util.ArrayList;

import com.kh.groubear.kms.room.model.vo.ReserveRoom;

public interface RoomService {

	int selectName(String empName) throws Exception ;

	void insertReserve(ReserveRoom rr);

	
	ArrayList<ReserveRoom> selectDate(ReserveRoom date);

}
