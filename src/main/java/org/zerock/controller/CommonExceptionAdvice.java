package org.zerock.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

// �씠 �겢�옒�뒪媛� 而⑦듃濡ㅻ윭�뿉�꽌 諛쒖깮�븯�뒗 �삁�쇅瑜� �쟾臾몄쟻�쑝濡� 泥섎━�븯�뒗 �겢�옒�뒪濡� 紐낆떆
@ControllerAdvice
public class CommonExceptionAdvice {
	
	//private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	/*
	@ExceptionHandler(Exception.class)
	public String common(Exception e) {
		logger.info(e.toString());
		return "error_common";
	}
	*/
	
	// 而⑦듃濡ㅻ윭�뿉�꽌 Exception �삁�쇅諛쒖깮�븯硫� 紐⑤몢 泥섎━ �븯�뒗 �삁�쇅�빖�뱾�윭
	@ExceptionHandler(Exception.class)
	public ModelAndView errorModelAndView(Exception ex) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("error.error_common");
		modelAndView.addObject("exception", ex);
		return modelAndView;
	}

}
