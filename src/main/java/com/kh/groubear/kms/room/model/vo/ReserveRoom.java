package com.kh.groubear.kms.room.model.vo;

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

public class ReserveRoom {

	private int reserveNo;
	
	private String startDate;
	private String endDate;
	private String roomContent;
	private int empNo;
	private int beamCode;
	private int roomNo;
	private String roomTitle;
	
}
