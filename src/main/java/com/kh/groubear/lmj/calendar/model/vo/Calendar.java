package com.kh.groubear.lmj.calendar.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Calendar {
	
	private int calendarNo;
	private String calendarTitle;
	private String calendarContent;
	private Date calendarDate;
	private String startDate;
	private String endDate;
	private int empNo;
	private String calendarStatus;
	
	
	
	
	
	
	
	
}
