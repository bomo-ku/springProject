package org.zerock.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;
import org.zerock.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(SearchBoardController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	@Inject
	private BoardService service;
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
		return "sboard.list";
	}
	
	@RequestMapping("/register.htm")
	public String registerGET(String userid, Model model) throws Exception{
		logger.info("> register get ..........");
        		
        model.addAttribute(this.service2.getName(userid));
        
		return "sboard.register";
	}
	
 
	@RequestMapping(value="/register.htm", method=RequestMethod.POST)
	public String registerPOST(String userid, BoardVO vo
			, Model model, RedirectAttributes rttr, MultipartFile file) throws Exception{
		logger.info("> register post ..........");
		logger.info("> originalName : "+file.getOriginalFilename());
		logger.info("> size : "+file.getSize());
		logger.info("> contentType : "+file.getContentType());
		
		String savedName = 
				uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		vo.setFileattach(savedName);
		
		this.service.regist(vo, userid);
		//this.service2.usePoint(userid);
		
		//model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg", "success");
		//return "/board/success";		
		return "redirect:/sboard/list.htm";
	}
	
	private String uploadFile(String originalFilename
			, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+originalFilename;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target); // byte [] -> File ���옣
		return savedName;
	} 
	
	@RequestMapping("/readPage.htm")
	public String read(@RequestParam("bno") int bno
			, @ModelAttribute("cri") SearchCriteria cri
			, Model model) throws Exception{
		
		this.service.hitUp(bno);  //*******
		model.addAttribute(this.service.read(bno));
		return "sboard.readPage";	
		
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
		
		return "redirect:/sboard/list.htm";
	}
	
	
	// p 298
		@RequestMapping(value="/modifyPage.htm"
				, method=RequestMethod.GET)
		public String  modifyPagingGet(
	            @RequestParam("bno") int bno
				, @ModelAttribute("cri") Criteria cri
	            , Model model) throws Exception{
			
			model.addAttribute("vo", this.service.read(bno));
			return "sboard.modifyPage";
			
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
			
			return "redirect:/sboard/list.htm";
		}  
		
}




