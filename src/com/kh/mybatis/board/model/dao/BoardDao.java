package com.kh.mybatis.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.board.model.vo.PageInfo;
import com.kh.mybatis.board.model.vo.SearchCondition;

public class BoardDao {

	public int getListCount(SqlSession sqlSession) throws Exception{
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSession sqlSession, PageInfo pi) throws Exception{
		// * offset : 몇개의 게시글을 건너 뛰고 조회할 지에 대해 계산
		// ex) boardLimit : 5
		// currentPage = 1		1~5		0개의 게시글 건너 뛰고 1부터 5개 조회
		// currentPage = 2		6~10	5개의 게시글 건너 뛰고 6부터 5개 조회
		// currentPage = 3		11~15	10개의 게시글 건너 뛰고 11부터 5개 조회
		// currentPage = 4		16~20	15개의 게시글 건너 뛰고 16부터 5개 조회
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);

	}

	public ArrayList<Board> selectListCon(SqlSession sqlSession, SearchCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectListCon", sc, rowBounds);
	}

	public int getListCountCon(SqlSession sqlSession, SearchCondition sc) throws Exception{
		return sqlSession.selectOne("boardMapper.getListCountCon", sc);
	}

	public Board detailBoard(SqlSession sqlSession, int bno) {
		
		return sqlSession.selectOne("boardMapper.detailBoard", bno);
	}

	public int updateCount(SqlSession sqlSession, int bno) {
		return sqlSession.update("boardMapper.updateCount",bno);
	}

	public Board selectBoard(SqlSession sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard", bno);
	}

}
