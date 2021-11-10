package com.kh.groubear.lyj.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ApprovalForm {
	
	private int approvalFormNo;
	private String approvalFormName;
	private String approvalFormContent;
	private String approvalCatCode;
	private String approvalCatName;

}
