package com.kh.groubear.lmj.sns.model.service;

import java.util.ArrayList;

import com.kh.groubear.lmj.sns.model.vo.Attechment;
import com.kh.groubear.lmj.sns.model.vo.Reply;
import com.kh.groubear.lmj.sns.model.vo.Sns;


public interface SnsService {

	ArrayList<Sns> selectList();

	void insertSns(Sns s, Attechment a);

	Sns selectSns(int sno);

	Attechment selectSnsFile(int sno);

	void deleteSns(int sno);

	void updateSns(Sns s);

	void updateSnsFile(Attechment a);

	ArrayList<Reply> selectReplyList(int sno);

	int insertReply(Reply r);

	void deleteReply(int rno);

	
	
	

	


}
