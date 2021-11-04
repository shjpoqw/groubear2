package com.kh.groubear.lyj.approval.model.vo;

import java.sql.Timestamp;

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
public class Reply {
	private int replyNo;
	private String replyContent;
	private int refApprovalNo;
	private int replyWriterNo;
	private String replyWriterName;
	//private Date createDate;
	private Timestamp createDate;
	private String status;
}