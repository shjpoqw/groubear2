package com.kh.groubear.lmj.sns.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.groubear.lmj.sns.model.service.SnsService;
import com.kh.groubear.lmj.sns.model.vo.Attechment;
import com.kh.groubear.lmj.sns.model.vo.Like;
import com.kh.groubear.lmj.sns.model.vo.Reply;
import com.kh.groubear.lmj.sns.model.vo.Sns;



@Controller
public class SnsController {

	@Autowired
	private SnsService snsService;
	
	
	@RequestMapping("list.sns")
	public String selectList(Model model) {
		
		ArrayList<Sns> list = snsService.selectList();
		System.out.println("@@@@@@controller list @@@@@@"+list);
		model.addAttribute("list",list);
	

		return "lmj/sns/SnsListView";
		
	}
	
	@RequestMapping("enrollForm.sns")
	public String enrollForm(){
		
		return "lmj/sns/SnsEnrollForm";
		
	}
	
	
	@RequestMapping("insert.sns")
	public String insertSns(Sns s, Attechment a, HttpServletRequest request, Model model,
			@RequestParam(name="uploadFile", required= false) MultipartFile file) {
		
		System.out.println("@@@@@@@@@@@@@@@@@@@"+s);
		System.out.println("@@@@@@@@@@@@@@@@@@@"+a);
		
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeFile = saveFile(file, request);
			
			if(changeFile != null) {
				a.setOriginFile(file.getOriginalFilename());
				a.setChangeFile(changeFile);
				
			}
			
		}
		
		
		snsService.insertSns(s, a);
		return "redirect:list.sns";
		
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/upload_files/";
		
		String originFile = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originFile.substring(originFile.lastIndexOf("."));
		
		String changeFile = currentTime + ext;
		
		
		try {
			file.transferTo(new File(savePath + changeFile));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return changeFile;
		
	}
	
	@RequestMapping("detail.sns")
	public ModelAndView selectSns(int sno, ModelAndView mv) {

		
		Sns s = snsService.selectSns(sno);
		Attechment a = snsService.selectSnsFile(sno);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@#!@$%#^#$&$^%&&&&&&$$$$$$$$$$$$$");
		System.out.println(s);
		System.out.println(a);
		System.out.println(sno);
		
		mv.addObject("s",s);
		mv.addObject("a",a);
		mv.setViewName("lmj/sns/SnsDetailView");
		
		return mv;
	}
	
	
	@RequestMapping("delete.sns")
	public String deleteSns(int sno , String fileName, HttpServletRequest request) {
		
		
		snsService.deleteSns(sno);
		
		if(!fileName.equals("")) {
			
			deleteFile(fileName, request);
		}
		System.out.println("delete sno^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" + sno);
		return "lmj/sns/SnsListView";

	}


	private void deleteFile(String fileName, HttpServletRequest request) {
	
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		File deleteFile = new File(savePath + fileName);
		
		deleteFile.delete();
	
	}
	
	@RequestMapping("updateForm.sns")
	public ModelAndView updateForm(int sno, ModelAndView mv) {
		
		Sns s = snsService.selectSns(sno);
		Attechment a = snsService.selectSnsFile(sno);
		
		
		mv.addObject("s",s);
		mv.addObject("a",a);
		mv.setViewName("lmj/sns/snsUpdateForm");
		
		return mv;
		
	}
	
	@RequestMapping("update.sns")
	public ModelAndView updateSns(Sns s, Attechment a, ModelAndView mv, HttpServletRequest request, Model model,
			@RequestParam(name="reUploadFile", required= false) MultipartFile file) {
		
		
		if(!file.getOriginalFilename().equals("")) {
			if(a.getChangeFile() != null) {
				deleteFile(a.getChangeFile(), request);
			}
			
			String changeName = saveFile(file,request);
			
			a.setOriginFile(file.getOriginalFilename());
			a.setChangeFile(changeName);
			
		}
		snsService.updateSns(s);
		snsService.updateSnsFile(a);
		
		System.out.println("ssssssssss = "+s);
		System.out.println("aaaaaaaaaa = "+ a);
		
		
		mv.addObject("sno", s.getSnsNo());
		mv.addObject("sno", a.getSnsNo());
		mv.setViewName("redirect:detail.sns");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value ="rlist.sns", produces="application/json;  charset=utf-8")
	public String selectReplyList(int sno) {
		
		ArrayList<Reply> list = snsService.selectReplyList(sno);
		
		System.out.println("@@@@@@@@ controller list : @@@@@@@@" + list);
		
		return new GsonBuilder().create().toJson(list);
				
	}
	
	
	@RequestMapping("rinsert.sns")
	public String insertReply(Reply r) {
		
		System.out.println("@@@@@@@@@@ controller r @@@@@@@@@@" + r);
		
		int result = snsService.insertReply(r);
		return String.valueOf(result);
	}
	
	
	@RequestMapping("rdelete.sns")
	public String deleteReply(int rno, HttpServletRequest request) {
		
		snsService.deleteReply(rno);
		
		
		return "redirect:detail.sns";

	}
	
	
	
	
}
