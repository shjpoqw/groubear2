package com.kh.groubear.member.model.vo;

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
public class EmpAttachment {
	private int fileNo;
	private String originName;
	private String changeName;
	private int empNO;
	
}
