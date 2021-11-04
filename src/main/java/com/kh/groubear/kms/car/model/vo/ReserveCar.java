package com.kh.groubear.kms.car.model.vo;

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
public class ReserveCar {
	
	private int _id;
	private String start;
	private String end;
	private String description;
	private String username;
	private int empNo;
	private String type;
	private String title;
	private String status;
	
	
}
