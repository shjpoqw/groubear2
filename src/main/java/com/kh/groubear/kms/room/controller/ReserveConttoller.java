 	package com.kh.groubear.kms.room.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.groubear.kms.room.model.service.RoomService;
import com.kh.groubear.kms.room.model.vo.ReserveRoom;
import com.kh.groubear.member.model.vo.Member;

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
		public String reserveRoom(
									@RequestParam("title") String title,
									@RequestParam("start") String start,
									@RequestParam("end") String end,
									@RequestParam("description") String description,
									@RequestParam("type") String type,
									@RequestParam("beamCode") String beamCode,
									HttpSession session) {
	        
			Member m = (Member)session.getAttribute("loginUser");
	        
			
	        
			ReserveRoom rr = new ReserveRoom() ;
			rr.setTitle((title));
			rr.setEnd(end);
			rr.setStart(start);
			rr.setDescription(description);
			rr.setType(type);
			rr.setEmpNo(m.getEmpNO());
			rr.setUsername(m.getEmpName());
			
				
			if (beamCode=="Y") {
				switch(type) {
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
			

			
			
			roomService.insertReserve(rr);
			
			
			
			
			return "kms/reserveRoomView";
		}
		
		
		@RequestMapping("changeCal.re")
		@ResponseBody
		public ArrayList<ReserveRoom> changeCal(@RequestParam("start") String start,
				@RequestParam("end") String end) {
			
			ReserveRoom date = new ReserveRoom();
			
			date.setStart(start);
			date.setEnd(end);
			ArrayList<ReserveRoom> rr = new ArrayList<ReserveRoom>(); 
			rr=roomService.selectDate(date);
			
			System.out.println("이름 : "+rr.get(0).getUsername()+"회의실 : 	"+rr.get(0).getType());
			
			
		
			
			return rr;
		}
		
		@RequestMapping("update.re")
		public String updateReserve(
										@RequestParam("_id") int _id,
										@RequestParam("title") String title,
										@RequestParam("start") String start,
										@RequestParam("end") String end,
										@RequestParam("description") String description,
										@RequestParam("type") String type) {
			ReserveRoom rr = new ReserveRoom() ;
			rr.set_id(_id);
			rr.setTitle((title));
			rr.setEnd(end);
			rr.setStart(start);
			rr.setDescription(description);
			rr.setType(type);
//			rr.setEmpNo(102);
			rr.setUsername("명선");
			//rr.setUserName("로그인유저이름");
			
			roomService.updateReserve(rr);
			
			return "kms/reserveRoomView";	
		}
		
		@RequestMapping("delete.re")
		public String deleteReserve(@RequestParam("_id") int _id) {
										
			ReserveRoom rr = new ReserveRoom() ;
			
			rr.set_id(_id);
			
			roomService.deleteReserve(rr);
			
			return "kms/reserveRoomView";	
		}
		
		
}
