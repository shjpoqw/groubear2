package com.kh.groubear.lyj.approval.model.vo;

import java.util.Date;

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
public class Approval {
	
	private int approvalNo;
	private String approvalTitle;
	private String approvalContent;
	private String writtenDate;
	private String dueDate;
	private int preservedYears;
	private int approvalFormNo;
	private String approvalFormName;
	private int approvalMNo;
	private int approvalFNo;
//	private String approvalMName;
//	private String approvalFName;
	private int writerNo;
	private String writerName;
	private int status;
	private String tempSave;
	
}
