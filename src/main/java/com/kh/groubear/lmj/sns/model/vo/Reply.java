package com.kh.groubear.lmj.sns.model.vo;

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
public class Reply {
	private int ReplyNo;
	private String ReplyContent;
	private String ReplyDate;
	private int SnsNo;
	private String ReplyWriter;
	
}
