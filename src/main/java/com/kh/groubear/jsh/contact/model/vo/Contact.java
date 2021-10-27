package com.kh.groubear.jsh.contact.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Setter
@Getter
@AllArgsConstructor
@ToString
public class Contact {
	private int contactNo;
	private String name;
	private int phone;
	private String email;
	private String companyName;
	private int companyPhone;
	private String memo;
	private String status;
	private int empNO;
	
	public Contact() {
		// TODO Auto-generated constructor stub
	}
}



