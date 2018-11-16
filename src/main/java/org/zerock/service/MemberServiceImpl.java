package org.zerock.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO memberDao;

	@Override
	public MemberVO getName(String userid) throws Exception {
		return this.memberDao.readName(userid);
		
	}

	

}
