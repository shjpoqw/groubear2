package com.kh.groubear.kms.member.controller;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.groubear.common.Pagination;
import com.kh.groubear.member.model.service.MemberService;
import com.kh.groubear.member.model.vo.Department;
import com.kh.groubear.member.model.vo.EmpAttachment;
import com.kh.groubear.member.model.vo.Job;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;
import com.kh.groubear.member.model.vo.PageInfo;
@SessionAttributes("loginUser") // Model에 loginUser 라는 키값으로 객체가 추가되면 자동으로 세션에 추가되는 어노테이션 (응답 페이지에 응답할 데이터가 있는 경우 3번)
@Controller
public class MemberController2 {
	@Autowired    // 빈스캐닝을 통해 해당 인터페이스를 구현한 클래스(구현체) 중에 @Serivce로 등록되어 있는 빈을 찾아서 자동으로 주입해준다.
	private MemberService memberService;
	private Member m;
	@RequestMapping("list.mem")
	public String memberListView(Model model,@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage,
											@RequestParam(value="searchDept", required = false, defaultValue="") String searchDept,
											@RequestParam(value="searchJob", required = false, defaultValue="") String searchJob,
											@RequestParam(value="search", required = false, defaultValue="") String search
											) {
		
		ArrayList<MemberView> list =null;
		ArrayList<Department> dept = memberService.selectDept();
		ArrayList<Job> job = memberService.selectJob();
		
		int listCount = memberService.countMember();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10,5);
		
		HashMap<String,String> searchMap = new HashMap();
		
		searchMap.put("dept",searchDept);
		searchMap.put("job",searchJob);
		searchMap.put("emp",search);
		
		if(searchDept.equals("")&&searchJob.equals("")&&search.equals("")) {
			list = memberService.selectList(pi);
			
			
		}else {
			list = memberService.searchList(pi,searchMap);
			
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("job", job);
		model.addAttribute("dept", dept);
		
		return "kms/memberListView";
	}
	
	@RequestMapping("detail.mem")
	public String detailView(Model model,int empNo,
			HttpSession session, HttpServletResponse response) throws Exception {
		ArrayList<Department> dept = memberService.selectDept();
		ArrayList<Job> job = memberService.selectJob();
		EmpAttachment profile = memberService.selectProfile(empNo);

	    
		m = (Member)session.getAttribute("loginUser");
		

		if (!m.getEmpId().equals("admin")) {
				
			 response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('관리자만 접근 가능합니다..'); history.go(-1);</script>");
	         out.flush();

			return "redirect:list.mem";
			
			 
		}
		MemberView mv = memberService.selectMember(empNo);
		
		model.addAttribute("job", job);
		model.addAttribute("dept", dept);
		model.addAttribute("member",mv);
		model.addAttribute("profile", profile);
		
		return "kms/detailView";
	}
	@RequestMapping("update.ad")
	public String updateMember(@ModelAttribute Member member, HttpServletRequest request,
							 Model model) throws Exception {
	
		
		
		

		MemberView userInfo = memberService.updateMember2(member);
		
		model.addAttribute("member", userInfo);

		return "redirect:detail.mem?empNo="+member.getEmpNO();
	}
	

	
	@RequestMapping("delete.ad")
	public String deleteMember(String empId) {
		
		memberService.deleteMember2(empId);
		
		return "redirect:list.mem";
	}

}
