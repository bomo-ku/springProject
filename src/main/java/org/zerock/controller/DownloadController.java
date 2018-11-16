	package org.zerock.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DownloadController implements ApplicationContextAware{

	
	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);	
	 private WebApplicationContext context = null;
     
	    @RequestMapping("/download.htm")
	    public ModelAndView download(
	                                  @RequestParam("fileName")String fileName, 
	                                  HttpServletRequest request, HttpServletResponse response)
{     
	    	
	    	String savePath = "C://zzz//upload/" ;
	    	System.out.println(">>>>>savePath :"+savePath);
	    	
	    	// 서버에 실제 저장된 파일명
		    //String filename = "96cea086-ff45-4471-a08d-8b3a46a60fc1_power.jpg";
		    // 실제 내보낼 파일명  ---> filename		 
		    File file = new File(savePath, fileName);
	    	
	      /*   
	        String fullPath = path + "\\" + fileName;	       
	        System.out.println(">>>>fullPath:" + fullPath);
	        File file = new File(fullPath);	         */
	        return new ModelAndView("download", "downloadFile", file);
	    }
	 
	    @Override
	    public void setApplicationContext(ApplicationContext arg0)
	            throws BeansException {	   
	         
	        this.context = (WebApplicationContext)arg0;
	         
	    }	     
	}
