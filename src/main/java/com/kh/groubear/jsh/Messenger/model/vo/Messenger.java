package com.kh.groubear.jsh.Messenger.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@AllArgsConstructor
@ToString
public class Messenger {
	private int messengerNo;
	private String title;
	private String pwd;
	private String status;
	private int empNO;
	private Date lastDate;
	
	public Messenger() {
		// TODO Auto-generated constructor stub
	}
}
