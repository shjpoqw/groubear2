package com.kh.groubear.member.model.vo;

import java.sql.Date;

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
public class MemberView {
	private int empNO;
	private String empName;
	private String empId;
	private String empNum;
	private String empPwd;
	private String email; // 나중에 회원가입 시
	private String phone;
	private int salary;
	private Date hireDate;
	private String address;
	private String empYN;
	private String jobCode;
	private String deptCode;
	private String deptName;
	private String jobName;
}
