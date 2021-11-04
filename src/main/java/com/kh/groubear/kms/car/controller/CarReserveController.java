package com.kh.groubear.kms.car.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.groubear.kms.car.model.service.CarService;
import com.kh.groubear.kms.car.model.vo.ReserveCar;
import com.kh.groubear.member.model.vo.Member;

@SessionAttributes("loginUser") 
@Controller
public class CarReserveController {

	
	@Autowired
	CarService carService;
	
	@RequestMapping("carView.re")
	public String CarView() {
		
		
		return "kms/reserveCarView";
	}
	
	@RequestMapping("reserveCar.re")
	public String reserveCar(
			@RequestParam("title") String title,
			@RequestParam("start") String start,
			@RequestParam("end") String end,
			@RequestParam("description") String description,
			@RequestParam("type") String type) {
		
		
		ReserveCar rc = new ReserveCar();
		
		rc.setType(type);
		rc.setDescription(description);
		rc.setEnd(end);
		rc.setStart(start);
		rc.setTitle(title);
		rc.setUsername("명선");
		rc.setEmpNo(102);
		
		carService.insertReserve(rc);
		System.out.println("성공1? ");
		
		return "kms/reserveCarView";
	}
	
	@RequestMapping("changeCar.re")
	@ResponseBody
	public ArrayList<ReserveCar> changeCarCal(@RequestParam("start") String start,
			@RequestParam("end") String end){
		
		ReserveCar date = new ReserveCar();
		
		date.setStart(start);
		date.setEnd(end);
		ArrayList<ReserveCar> rc = new ArrayList<ReserveCar>(); 
		rc=carService.selectDate(date);
		
		
		
	
		
		return rc;
	}
	@RequestMapping("updateCar.re")
	public String updateCar(
									@RequestParam("_id") int _id,
									@RequestParam("title") String title,
									@RequestParam("start") String start,
									@RequestParam("end") String end,
									@RequestParam("description") String description,
									@RequestParam("type") String type,
									HttpSession session) {
		
		 
		Member m = (Member)session.getAttribute("loginUser");
        
		ReserveCar rc = new ReserveCar() ;
		
		System.out.println("_id:"+_id);
		rc.set_id(_id);
		rc.setTitle((title));
		rc.setEnd(end);
		rc.setStart(start);
		rc.setDescription(description);
		rc.setType(type);
		rc.setEmpNo(m.getEmpNO());
		rc.setUsername(m.getEmpName());
		
		carService.updateReserve(rc);
		
		return "kms/reserveCarView";	
	}
	

	@RequestMapping("deleteCar.re")
	public String deleteCarReserve(@RequestParam("_id") int _id) {
									
		

		ReserveCar rc = new ReserveCar() ;
		rc.set_id(_id);
		carService.deleteReserve(rc);
		
		return "kms/reserveCarView";	
	}

@RequestMapping("addModal.room")
		public String addModal() {
			System.out.println("실행");
			return "kms/reserveRoomView";
		}
}
