package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;
import org.zerock.service.MemberService;
import org.zerock.service.iBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/iboard/*")
public class ImageBoardController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ImageBoardController.class);
	
	@Inject
	private iBoardService service;
	@Inject
	private MemberService service2;
	
	
	@RequestMapping(value="/list.htm", method=RequestMethod.GET)
	public String listPage(
	  @ModelAttribute("cri") SearchCriteria cri
	  , Model model) throws Exception{
		//logger.info(cri.toString());
		model.addAttribute("list"
				, this.service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(
				this.service.listSearchCount(cri));
		//System.out.println(" >>> " + pageMaker.toString() );
		model.addAttribute("pageMaker", pageMaker);
		return "iboard.list";
	}
	
	@RequestMapping("/register.htm")
	public String registerGET(String userid, Model model) throws Exception{
		logger.info("> register get ..........");
        
		System.out.println(userid);		
        model.addAttribute(this.service2.getName(userid));
        
		return "iboard.register";
	}
	
	@RequestMapping(value="/register.htm", method=RequestMethod.POST)
	public String registerPOST(BoardVO vo
			, Model model, RedirectAttributes rttr) throws Exception{
		logger.info("> register post ..........");
		this.service.regist(vo);
		//model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg", "success");
		//return "/board/success";		
		return "redirect:/iboard/list.htm";
	}
	
	@RequestMapping("/readPage.htm")
	public String read(@RequestParam("bno") int bno
			, @ModelAttribute("cri") SearchCriteria cri
			, Model model) throws Exception{
		
		this.service.hitUp(bno);  //*******
		model.addAttribute(this.service.read(bno));
		return "iboard.readPage";	
		
	}
	
	@RequestMapping(value="/removePage.htm", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno
			, SearchCriteria cri
			, RedirectAttributes rttr) throws Exception{		
		this.service.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/iboard/list.htm";
	}
	
	
	// p 298
		@RequestMapping(value="/modifyPage.htm"
				, method=RequestMethod.GET)
		public String  modifyPagingGet(
	            @RequestParam("bno") int bno
				, @ModelAttribute("cri") Criteria cri
	            , Model model) throws Exception{
			
			model.addAttribute("vo", this.service.read(bno));
			return "iboard.modifyPage";
			
		}  
		
		// p 300
		@RequestMapping(value="/modifyPage.htm", method=RequestMethod.POST)
		public String  modifyPagingPOST(
	            BoardVO vo            
				, Criteria cri
	            , RedirectAttributes rttr) throws Exception{
			
			this.service.modify(vo);
			
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("msg", "success");
			
			return "redirect:/iboard/list.htm";
		}  
		
}




