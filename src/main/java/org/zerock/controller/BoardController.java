package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping("/register")
	public void registerGET(BoardVO vo, Model model) throws Exception{
		logger.info("> register get ..........");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(BoardVO vo
			, Model model, RedirectAttributes rttr) throws Exception{
		logger.info("> register post ..........");
		this.service.regist(vo);
		//model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg", "success");
		//return "/board/success";		
		return "redirect:/board/listCri";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("> show all list ..........");
		model.addAttribute("list", this.service.listAll());
	}
	
	@RequestMapping(value="/listCri", method=RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		logger.info("> show list Page with Criteria ..........");		
		model.addAttribute("list", this.service.listCriteria(cri));
		
		// p 274 추가  
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		//
		//System.out.println( pageMaker.toString() );
		
		model.addAttribute("pageMaker", pageMaker);
		//
		
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, Model model) throws Exception{		
		model.addAttribute(this.service.read(bno));
	}

	// p 293 
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno
			, @ModelAttribute("cri") Criteria cri
			, Model model) throws Exception{		
		model.addAttribute(this.service.read(bno));
	}
	
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno
			, RedirectAttributes rttr) throws Exception{		
		this.service.remove(bno);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/board/listAll";
	}
	
	// p 296 
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno
			, Criteria cri
			, RedirectAttributes rttr) throws Exception{		
		this.service.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","success");
		return "redirect:/board/listCri";
	}
	
	@RequestMapping("/modify")
	public void modifyGET(int bno, Model model) throws Exception{
		model.addAttribute("vo", this.service.read(bno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String  modifyPOST(BoardVO vo
            , RedirectAttributes rttr) throws Exception{
		logger.info("> modify post ..........");
		this.service.modify(vo);
		//model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg:", "success");
		//return "/board/success";		
		return "redirect:/board/listAll";
	} 
	
	// p 298
	@RequestMapping(value="/modifyPage"
			, method=RequestMethod.GET)
	public void  modifyPagingGet(
            @RequestParam("bno") int bno
			, @ModelAttribute("cri") Criteria cri
            , Model model) throws Exception{
		
		model.addAttribute("vo", this.service.read(bno));
		
	}  
	
	// p 300
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String  modifyPagingPOST(
            BoardVO vo            
			, Criteria cri
            , RedirectAttributes rttr) throws Exception{
		
		this.service.modify(vo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("msg", "success");
		
		return "redirect:/board/listCri";
	}  
		
}
