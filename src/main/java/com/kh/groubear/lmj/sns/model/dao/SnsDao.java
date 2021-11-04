package com.kh.groubear.lmj.sns.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.groubear.lmj.sns.model.vo.Attechment;
import com.kh.groubear.lmj.sns.model.vo.Reply;
import com.kh.groubear.lmj.sns.model.vo.Sns;

@Repository
public class SnsDao {

	public ArrayList<Sns> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("snsMapper.selectList");
	}

	

	public int insertSns(SqlSessionTemplate sqlSession, Sns s) {
		
		return sqlSession.insert("snsMapper.insert"	, s);
	}
	
	public int insertFileSns(SqlSessionTemplate sqlSession, Attechment a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("snsAttechmentMapper.insertFile"  , a);
	}



	public Sns selectSns(SqlSessionTemplate sqlSession, int sno) {
		
		return sqlSession.selectOne("snsMapper.selectSns", sno);
	}



	public Attechment selectSnsFile(SqlSessionTemplate sqlSession, int sno) {
		
		return sqlSession.selectOne("snsAttechmentMapper.selectSnsFile", sno);
	}



	public int deleteSns(SqlSessionTemplate sqlSession, int sno) {
		
		return sqlSession.update("snsMapper.deleteSns", sno);
	}



	public static int updateSns(SqlSessionTemplate sqlSession, Sns s) {
		
		return sqlSession.update("snsMapper.update"	, s);
	}



	public static int updateSnsFile(SqlSessionTemplate sqlSession, Attechment a) {
		
		return sqlSession.update("snsAttechmentMapper.updateFile"  , a);
	}



	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int sno) {
		
		return (ArrayList)sqlSession.selectList("snsReplyMapper.selectReplyList",sno);
	}



	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("snsReplyMapper.insertReply",r);
	}



	public int deleteReply(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("snsReplyMapper.deleteReply", rno);
	}



	

}
