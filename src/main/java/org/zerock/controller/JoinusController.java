package org.zerock.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.MemberVO;
import org.zerock.persistence.MemberDAO;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {

	private MemberDAO memberDao = null;
	
	@Autowired	
	public void setNoticeDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	
	
	@RequestMapping(value="join.htm", method=RequestMethod.GET)
	public String join() {
		return "joinus.join";
	}
	
	
	@RequestMapping(value="join.htm", method=RequestMethod.POST)
	public String join(MemberVO vo) throws Exception {
		this.memberDao.insertMember(vo);
		return "redirect:../index.htm";
		//return null;
	}
	
	@RequestMapping("login.htm")
	public String login() {
		return "joinus.login";		
	}
	
	
	
		
}
