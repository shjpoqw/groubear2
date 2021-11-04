package com.kh.groubear.jsh.Messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@AllArgsConstructor
@Getter
@ToString
public class MemberMsg {
	private int empNO;
	private String empName;
	private int stateMessageNo;
	private String message;
	private String originName;
	private String changeName;
	
	
	public MemberMsg() {
		// TODO Auto-generated constructor stub
	}
}
