package com.kh.groubear.lmj.calendar.model.service;

import java.util.List;

import com.kh.groubear.lmj.calendar.model.vo.Calendar;

public interface CalendarService{

	List<Calendar> showCalendar();

	void addCalendar(Calendar cal);

	Calendar selectCalendar(int cno);

	void deleteCalendar(int cno);
	
	
}
