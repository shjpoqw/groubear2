package com.kh.groubear.lmj.sns.model.vo;

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
public class Sns {
	
	private int snsNo;
	private int lCount;
	private String snsTitle;
	private String snsContent;
	private Date snsDate;
	//private String snsWriter;
	private int empNo;
	private String snsStatus;
	private String snsFile;
	
	
	
	

}
