package com.kh.groubear.lmj.calendar.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.lmj.calendar.model.dao.CalendarDao;
import com.kh.groubear.lmj.calendar.model.vo.Calendar;




@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CalendarDao calendarDao;

	@Override
	public List<Calendar> showCalendar() {
		// TODO Auto-generated method stub
		return calendarDao.showCalendar(sqlSession);
	}

	@Override
	public void addCalendar(Calendar cal) {
		// TODO Auto-generated method stub
		calendarDao.addCalendar(sqlSession, cal);
	}

	@Override
	public Calendar selectCalendar(int cno) {
		
		Calendar cal = null;
		
		cal = calendarDao.selectCalendar(sqlSession,cno);
	
		return cal;
	}

	@Override
	public void deleteCalendar(int cno) {
		int result = calendarDao.deleteCalendar(sqlSession,cno);
		
		
	}
}
