package com.kh.groubear.lmj.sns.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groubear.common.exception.CommException;
import com.kh.groubear.lmj.sns.model.dao.SnsDao;
import com.kh.groubear.lmj.sns.model.vo.Attechment;
import com.kh.groubear.lmj.sns.model.vo.Reply;
import com.kh.groubear.lmj.sns.model.vo.Sns;


@Service
public class SnsServiceImpl implements SnsService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SnsDao snsDao;
	
	
	@Override
	public ArrayList<Sns> selectList() {
		// TODO Auto-generated method stub
		return snsDao.selectList(sqlSession);
	}


	@Override
	public void insertSns(Sns s,Attechment a) {
		
		
	
		
		int result = snsDao.insertSns(sqlSession, s);
		
		if(result > 0) {
			
			
			int result2 =snsDao.insertFileSns(sqlSession, a);
			
		}else {
			throw new CommException("등록 실패");
			
		}
		
		
	}


	@Override
	public Sns selectSns(int sno) {
		
		Sns s = null;
		
		s = snsDao.selectSns(sqlSession,sno);
	
		return s;
	
	}


	@Override
	public Attechment selectSnsFile(int sno) {
		
		Attechment a = null;
		
		a = snsDao.selectSnsFile(sqlSession,sno);
	
		return a;
	}


	@Override
	public void deleteSns(int sno) {
		
		int result = snsDao.deleteSns(sqlSession,sno);
		
		if(result <0) {
			throw new CommException("삭제실패");
		}
		
	}


	@Override
	public void updateSns(Sns s) {
		
		int result = snsDao.updateSns(sqlSession,s);
		
		if(result < 0) {
			throw new CommException("updateBoard 실패 ");
		}
		
	}


	@Override
	public void updateSnsFile(Attechment a) {
		
		int result = snsDao.updateSnsFile(sqlSession,a);
		
		if(result < 0) {
			throw new CommException("updateBoard 실패 ");
		}
		
	}


	@Override
	public ArrayList<Reply> selectReplyList(int sno) {
		
		return snsDao.selectReplyList(sqlSession,sno);
	}


	@Override
	public int insertReply(Reply r) {
		
		int result = snsDao.insertReply(sqlSession, r);
		
		if(result < 0) {
			throw new CommException("insertReply 실패 ");
		}
		return result;
	}


	@Override
	public void deleteReply(int rno) {
		
		int result = snsDao.deleteReply(sqlSession,rno);
	}


	




	


}
