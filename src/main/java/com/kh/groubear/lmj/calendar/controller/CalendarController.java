package com.kh.groubear.lmj.calendar.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groubear.lmj.calendar.model.service.CalendarService;
import com.kh.groubear.lmj.calendar.model.vo.Calendar;


@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
	
		
	@RequestMapping("calendarEnrollForm.cal")
	public String enrollForm() {
		return "lmj/calendar/CalendarEnrollForm";
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/addCalendar", method=RequestMethod.POST)
	public Map<Object,Object>  addCalendar(@RequestBody Calendar cal){
		
		
		Map<Object, Object>map = new HashMap<Object, Object>();
		
		
		System.out.println("******************calendar controller 도착888888888888888888888");
		
		
		
		System.out.println("^^^^^^^^^^^^^^^^controller Map : " + cal);
		
		
		calendarService.addCalendar(cal);
		
		
		
		return map;
		
	}
	
	@RequestMapping("calendarList.cal")
	public String calendar(Model model) {
		model.addAttribute("showCalendar", calendarService.showCalendar());
		
		return "lmj/calendar/Calendar";
	}
	
	
	
	@RequestMapping("calendarDetailView.cal")
	public ModelAndView selectCalendar(int cno, ModelAndView mv) {

		
		 Calendar cal = calendarService.selectCalendar(cno);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@#!@$%#^#$&$^%&&&&&&$$$$$$$$$$$$$ cno " + cno);
		System.out.println("@@@@@@@@@@@@@@@@@@@@#!@$%#^#$&$^%&&&&&&$$$$$$$$$$$$$ cal " + cal);
	
		
		mv.addObject("cal",cal);
		
		mv.setViewName("lmj/calendar/CalendarDetailView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete.cal", method=RequestMethod.POST)
	public int deleteSns(int cno,  HttpServletRequest request) {
		
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&"+cno);
		
		calendarService.deleteCalendar(cno);
		
		
		
		return cno;

	}
	
}
