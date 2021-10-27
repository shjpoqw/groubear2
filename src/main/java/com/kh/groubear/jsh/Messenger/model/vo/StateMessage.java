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
public class StateMessage {
	private int stateMessageNo;
	private String message;
	private int empNO;
	
}
