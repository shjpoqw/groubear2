package com.kh.groubear.kms.room.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.groubear.kms.room.model.service.RoomService;
import com.kh.groubear.kms.room.model.vo.ReserveRoom;

@SessionAttributes("loginUser") 
@Controller
public class ReserveConttoller {
	
	 	@Autowired
	 	private RoomService roomService;
	
		@RequestMapping("roomView.re")
		public String roomView() {
			
			return "kms/reserveRoomView";
		}
		
		@RequestMapping("reserveRoom.re")
		public String reserveRoom(@RequestParam("empNo") String empNo,
									@RequestParam("title") String title,
									@RequestParam("startDate") String startDate,
									@RequestParam("endDate") String endDate,
									@RequestParam("roomContent") String roomContent,
									@RequestParam("roomNo") String roomNo,
									@RequestParam("beamCode") String beamCode) {
			
	        
	        
	        System.out.println("title : "+title);
	        System.out.println("startDate : "+ startDate);
	        System.out.println("endDate : "+endDate);
	        System.out.println("roomContent : "+ roomContent);
	        System.out.println("roomNo : "+ roomNo);
	        System.out.println("beamCode : "+beamCode);
	        
			ReserveRoom rr = new ReserveRoom() ;
			rr.setRoomTitle((title));
			rr.setEndDate(endDate);
			rr.setStartDate(startDate);
			rr.setRoomContent(roomContent);
			rr.setRoomNo(Integer.parseInt(roomNo));
			rr.setEmpNo(102);
			//rr.setEmpNo(Integer.parseInt(empNo));
			
			
			
			if (beamCode=="Y") {
				switch(roomNo) {
				case "01":
					rr.setBeamCode(01);
					System.out.println("beamCode : 1");
					break;
				case "02":
					rr.setBeamCode(02);
					System.out.println("beamCode : 2");
					break;
				case "03":
					rr.setBeamCode(03);
					System.out.println("beamCode : 3");
					break;
				case "04":
					rr.setBeamCode(04);
					System.out.println("beamCode : 4");
					break;
				}
			}
			
//			rr.setEmpNo(roomService.selectName(empName));
			
			
			roomService.insertReserve(rr);
			
			
			
			
			return "kms/reserveRoomView";
		}
		
		
		@RequestMapping("changeCal.re")
		@ResponseBody
		public ArrayList<ReserveRoom> changeCal(@RequestParam("startDate") String startDate,
				@RequestParam("endDate") String endDate) {
			
			System.out.println("changeCal : 성공?");
			ReserveRoom date = new ReserveRoom();
			
			date.setStartDate(startDate);
			date.setEndDate(endDate);
			ArrayList<ReserveRoom> rr = new ArrayList<ReserveRoom>(); 
			rr=roomService.selectDate(date);
			
			
			
			return rr;
		}
		
		
}
