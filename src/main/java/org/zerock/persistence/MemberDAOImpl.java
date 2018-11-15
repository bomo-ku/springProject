package org.zerock.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	// memberMapper.xml의 mapper namespace 속성값.
	private static final String namespace = 
			"org.zerock.mapper.MemberMapper";

	@Override
	public String getTime() {
		return this.sqlSession.selectOne(namespace +".getTime");
	}

	@Override
	public void insertMember(MemberVO vo)  throws Exception{
		System.out.println(">>>>>>");
		System.out.println( this.sqlSession.insert(namespace +".insertMember", vo) );
		System.out.println("<<<<<<");
	}

	// p 144
	@Override
	public MemberVO readMember(String userid) throws Exception {		
		return this.sqlSession.selectOne(namespace +".selectMember", userid);
	}

	@Override
	public MemberVO readWithPW(String userid, String userpw) throws Exception {
		// p 143  설명
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userid", userid);
		paramMap.put("userpw", userpw);
		//
		return this.sqlSession.selectOne(namespace +".readWithPW", paramMap);
	}

	@Override
	public MemberVO readName(String userid) throws Exception {
		System.out.println(">>>>>> 2차:" + userid);
		return this.sqlSession.selectOne(namespace +".selectName", userid);
	}

}
