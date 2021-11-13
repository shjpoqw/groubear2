package com.kh.groubear.lmj.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.groubear.lmj.calendar.model.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
	
	@RequestMapping("calendarList.cal")
	public String calendarList() {
		
		return "lmj/calendar/Calendar";
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
}
