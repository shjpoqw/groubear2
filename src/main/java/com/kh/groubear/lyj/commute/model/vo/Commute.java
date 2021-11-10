package com.kh.groubear.lyj.commute.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Commute {
	
	private int commuteNo;
	private String commuteDate;
	private String worktimeStart;
	private String worktimeEnd;
	private int empNo;
	private String empName;
	private String jobName;
	private String deptName;
	private String startDate;
	private String endDate;

}
