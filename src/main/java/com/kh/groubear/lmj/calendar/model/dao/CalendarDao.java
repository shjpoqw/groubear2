package com.kh.groubear.lmj.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.lmj.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {

	
	public List<Calendar> showCalendar(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("calendarMapper.showCalendar");
	}

	public void  addCalendar(SqlSessionTemplate sqlSession, Calendar cal) {
		// TODO Auto-generated method stub
		sqlSession.insert("calendarMapper.addCalendar", cal);
	}

	public Calendar selectCalendar(SqlSessionTemplate sqlSession, int cno) {
		
		return sqlSession.selectOne("calendarMapper.selectCalendar", cno);
	}

	public int deleteCalendar(SqlSessionTemplate sqlSession, int cno) {
		// TODO Auto-generated method stub
		return sqlSession.update("calendarMapper.deleteCalendar", cno);
	}

}
