package com.kh.groubear.jsh.Messenger.model.vo;

import java.util.Date;

import com.kh.groubear.jsh.contact.model.vo.Contact;

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
public class Chat {
	private int chatNo;
	private String message;
	private Date createDate;
	private int empNO;
	private int toEmpNo;
	
	public Chat() {
		// TODO Auto-generated constructor stub
	}
}
