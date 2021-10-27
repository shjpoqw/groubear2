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
	
	int approvalNo;
	String approvalTitle;
	String approvalContent;
	Date dueDate;
	Date endDate;
//	int approvalMNo;
//	int approvalFNo;
	String approvalMName;
	String approvalFName;
//	int approvalFormNo;
	String approvalFormName;
	int writerNo;
	String writerName;
	int status;

}
