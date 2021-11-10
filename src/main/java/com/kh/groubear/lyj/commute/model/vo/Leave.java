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
public class Leave {
	
	private int leaveNo;
	private String leaveOccurDate;
	private String leaveEndDate;
	private String leaveUseDate;
	private String leaveIsUse;
//	private String leaveCatCode;
	private int empNo;
	private int count;

}
