package com.kh.groubear.lmj.calendar.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.lmj.calendar.model.dao.CalendarDao;



@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CalendarDao calendarDao;
}
