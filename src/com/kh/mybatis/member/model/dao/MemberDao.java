package com.kh.mybatis.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.member.model.vo.Member;

public class MemberDao {

	public Member loginMember(SqlSession sqlSession, Member m) {
		Member loginUser = null;
		loginUser = sqlSession.selectOne("memberMapper.loginMember",m);
		return loginUser;
	}

	public int insertMember(SqlSession sqlSession, Member m) throws Exception{
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public int updateMember(SqlSession sqlSession, Member m) {
		return sqlSession.insert("memberMapper.updateMember",m);
	}

	public int deleteMember(SqlSession sqlSession, Member m) {
		return sqlSession.insert("memberMapper.deleteMember",m);
	}

}
