package com.kh.groubear.lmj.sns.model.vo;

import java.sql.Date;

import com.kh.groubear.member.model.vo.Member;

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
	private Attechment snsFile;
	private Member emp;
	
	
	
	

}
