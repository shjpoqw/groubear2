package com.kh.groubear.jsh.Messenger.model.vo;

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
public class ChatView {
	private int chatNo;
	private String message;
	private String createDate;
	private int empNO;
	private int toEmpNo;
	private int chatread;
	private String empName;
	private String toEmpName;
	private String changeName;
	private String toChangeName;
	public ChatView() {
		// TODO Auto-generated constructor stub
	}
}
