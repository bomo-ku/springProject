package org.zerock.persistence;

import org.zerock.domain.MemberVO;

public interface MemberDAO {
	
	public String getTime();
	public void insertMember(MemberVO vo)  throws Exception;
	
	// p 141 Ãß°¡
	public MemberVO readMember(String userid) throws Exception;
	public MemberVO readWithPW(String userid, String userpw) throws Exception;
	
	public MemberVO readName(String userid) throws Exception;
	public MemberVO usePt(String userid);
	
}
