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
	
	int approvalFormNo;
	String approvalFormName;
	String approvalFormContent;
	String approvalCatCode;
	String approvalCatName;

}
