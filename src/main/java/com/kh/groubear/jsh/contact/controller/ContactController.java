  package com.kh.groubear.jsh.contact.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.groubear.jsh.contact.model.service.ContactService;
import com.kh.groubear.jsh.contact.model.vo.Contact;
import com.kh.groubear.member.model.service.MemberService;
import com.kh.groubear.member.model.vo.Department;
import com.kh.groubear.member.model.vo.MemberView;

@Controller
public class ContactController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ContactService contactService;

	@RequestMapping("publicList.ct")
	public String publicList(@RequestParam(value = "p", required = false, defaultValue = "1") int p,
			@RequestParam(value = "d", required = false, defaultValue = "") String d,
			@RequestParam(value = "q", required = false, defaultValue = "") String q
			, Model model) {

		ArrayList<Department> dept = memberService.selectDept();
		String department = "%" + d + "%";
		int page = p;
		String query = "%" + q + "%";
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("page", page);
		map.put("query", query);
		map.put("department", department);

		ArrayList<MemberView> list = memberService.contactSelectList(map);
		int count = memberService.countMember();
		
		
		model.addAttribute("list", list);
		model.addAttribute("dept", dept);
		model.addAttribute("count", count);

		return "jsh/contact/publicList";
	}

	@RequestMapping("contactList.ct")
	public String contactList(@RequestParam(value = "p", required = false, defaultValue = "1") int p,
			@RequestParam(value = "q", required = false, defaultValue = "") String q, Model model) {
		
		int page = p;
		String query = "%" + q + "%";
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("page", page);
		map.put("query", query);
		ArrayList<Contact> list = contactService.selectList(map);
		
		int count = contactService.countContact();
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);

		return "jsh/contact/contactList";
	}
	
	@RequestMapping("insertContact.ct")
	public String insertContact(Contact c, Model model) {
		
		contactService.insertContact(c);
		
		return "redirect:contactList.ct";
	}
	
	@RequestMapping("updateContact.ct")
	public String updateContact(Contact c,
			Model model) {
		contactService.updateContact(c);
		
		return "redirect:contactList.ct";
	}
	
	
	@RequestMapping("deleteContact.ct")
	public String deleteContact(@RequestParam(value = "deleteNo") int deleteNo, Model model) {
		
		contactService.deleteContact(deleteNo);
		
		return "redirect:contactList.ct";
	}
	

	
}
