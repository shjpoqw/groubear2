package com.kh.groubear.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.groubear.common.Pagination;
import com.kh.groubear.common.exception.CommException;
import com.kh.groubear.member.model.service.MemberService;
import com.kh.groubear.member.model.vo.Department;
import com.kh.groubear.member.model.vo.EmpAttachment;
import com.kh.groubear.member.model.vo.Job;
import com.kh.groubear.member.model.vo.Member;
import com.kh.groubear.member.model.vo.MemberView;
import com.kh.groubear.member.model.vo.PageInfo;

@SessionAttributes("loginUser") // Model에 loginUser 라는 키값으로 객체가 추가되면 자동으로 세션에 추가되는 어노테이션 (응답 페이지에 응답할 데이터가 있는 경우 3번)
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired    // 빈스캐닝을 통해 해당 인터페이스를 구현한 클래스(구현체) 중에 @Serivce로 등록되어 있는 빈을 찾아서 자동으로 주입해준다.
	private MemberService memberService;
	

	
	

	
	@RequestMapping("logout.me")
   public String logoutMember(HttpSession session ,SessionStatus status) {
      Member user = (Member)session.getAttribute("loginUser");
      
      status.setComplete(); // 현재 컨트롤러에 @SessionAttributes 에 의해 저장된 오브젝트를 제거
      return "redirect:/";
   }
	
	@RequestMapping("enrollForm.me")
	public String enrollForm(HttpServletRequest request) {
		ArrayList<Job> job = memberService.selectJob();
		ArrayList<Department> dept = memberService.selectDept();
		
		request.setAttribute("job",job);
		request.setAttribute("dept", dept);

		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2, HttpSession session) {
		
		m.setAddress(post+"/"+address1+"/"+address2);
		System.out.println(m);
		//암호화 작업
		String encPwd = bCryptPasswordEncoder.encode(m.getEmpPwd());
		
		
		m.setEmpPwd(encPwd);
		
		memberService.insertMember(m);
		
		System.out.println("성공");
	
		session.setAttribute("msg", "회원가입 성공");
		
		return "redirect:/";
	}
	
	
	@RequestMapping("login.me")
	   public String loginMember(Member m, HttpServletRequest request, Model model) throws Exception {

	      Member loginUser = memberService.loginMember(bCryptPasswordEncoder, m);
	      EmpAttachment profile = memberService.selectProfile(loginUser.getEmpNO());
	      HttpSession session = request.getSession();
	      session.setAttribute("profile", profile);
	      model.addAttribute("loginUser", loginUser);
	      return "common/menubar"; // redirect:index.jsp
	   }
	
	// 마이페이지
   @RequestMapping("myPage.me")
   public String myPage(HttpSession session, Model model) {
      Member user = (Member) session.getAttribute("loginUser");
      EmpAttachment profile = memberService.selectProfile(user.getEmpNO());

      model.addAttribute("profile", profile);

      return "member/myPage";
   }

	
   @RequestMapping("update.me")
   public String updateMember(@ModelAttribute Member m, HttpServletRequest request, @RequestParam("post") String post,
         @RequestParam("address1") String address1, @RequestParam("address2") String address2,
         @RequestParam(value = "profile", required = false) MultipartFile profile, Model model) throws Exception {
      
	   System.out.println("======= profile " + profile);
      if (!profile.equals("") || profile != null) {

         EmpAttachment file = memberService.selectProfile(m.getEmpNO());
         if (file.getFileNo() != 0 && !file.getOriginName().equals("")) {
            deleteFile(file.getOriginName(), request);
         }
         String changeName = saveFile(profile, request);
         file.setOriginName(profile.getOriginalFilename());
         file.setChangeName(changeName);
         file.setEmpNO(m.getEmpNO());
         if (file.getFileNo() == 0) {
            memberService.insertProfile(file);
         } else {
            memberService.updateProfile(file);
         }
         
         EmpAttachment updateProfile = memberService.selectProfile(m.getEmpNO());
         HttpSession session = request.getSession();
         session.setAttribute("profile", updateProfile);
      }

      m.setAddress(post + "/" + address1 + "/" + address2);
      
      Member userInfo = memberService.updateMember(m);

      model.addAttribute("loginUser", userInfo);
      return "member/myPage";
   }
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\profile_files\\";

		System.out.println("savePath" + savePath);

		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();

	}
	
	@RequestMapping("delete.me")
	public String deleteMember(String userId) {
		
		memberService.deleteMember(userId);
		
		return "redirect:logout.me";
	}
	
	@RequestMapping("updatePwd.me")
	public String updatePwd(RedirectAttributes redirectAttributes, @RequestParam("newPwd") String newPwd, @RequestParam("newPwdAgain") String newPwdAgain) {
		redirectAttributes.addAttribute("newPwd", newPwd);
		redirectAttributes.addAttribute("newPwdAgain", newPwdAgain);
		
		return "redirect:myPage.me";
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\profile_files\\";

		System.out.println("savePath" + savePath);
		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ext;

		try {
			File path = new File(savePath);
			if(!path.exists()) {
				path.mkdirs();
			}
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			throw new CommException("file upload error");

		}
		return changeName;
	}
	
	@RequestMapping("main.p")
	public String mainPage() {
		
		
		
		return "common/menubar";
	}
	

}
