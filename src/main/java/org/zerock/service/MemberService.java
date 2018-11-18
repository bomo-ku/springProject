package org.zerock.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;

public interface MemberService {

	MemberVO getName(String userid) throws Exception;
	MemberVO usePoint(String userid) throws Exception;
	

}
