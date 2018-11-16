package org.zerock.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.util.MediaUtils;
import org.zerock.util.UploadFileUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = {"/upload/*", "/iboard/*"})

public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	// p 527
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/uploadForm.htm", method = RequestMethod.GET)
	public String uploadForm() {
		return "upload.uploadForm";	
		}
	   
	   
	@RequestMapping(value = "/uploadForm.htm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {	
		logger.info("> originalName : "+file.getOriginalFilename());
		logger.info("> size : "+file.getSize());
		logger.info("> contentType : "+file.getContentType());
		
		
		String savedName = 
				uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);
		
		return "upload.uploadResult";
	}

	private String uploadFile(String originalFilename
			, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+originalFilename;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target); // byte [] -> File ���옣

		return savedName;
	} 
	
	
	// p 536 Ajax �뾽濡쒕뱶�슜 而⑦듃濡ㅻ윭�� JSP �옉�꽦�븯湲�
	@RequestMapping(value="/uploadAjax.htm", method=RequestMethod.GET)
	public String uploadAjax() {
		
		return "upload.uploadAjax";
		
	}
	
	// p 544 Ajax 泥섎━�븯湲�
	@RequestMapping(value="/uploadAjax.htm"
			, method=RequestMethod.POST ) // �븳援��뼱  �젙�긽 �쟾�넚�쓣 �쐞�븳 �꽕�젙
	public ResponseEntity<String> uploadAjax(MultipartFile file)
	throws Exception{
		
		 
		
		logger.info(">>>> originalName : "+file.getOriginalFilename());
		
		//logger.info("> size : "+file.getSize());
		//logger.info("> contentType : "+file.getContentType());
		
		return new ResponseEntity<>(
				//file.getOriginalFilename()
				UploadFileUtils.uploadFile(
						uploadPath
						, file.getOriginalFilename()
						, file.getBytes())
				, HttpStatus.CREATED);
		
	}
	
	@ResponseBody
	@RequestMapping("/displayFile.htm")
	public ResponseEntity<byte[]> dispFile(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		logger.info("FILE NAME : "+ fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\""); 
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in)
					,headers
					,HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(
					HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
			
	}
	
	// p 578
	@ResponseBody
	@RequestMapping(value="/deleteFile.htm", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file : "+ fileName );
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		if(mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
		
			System.out.println(">>>>" + uploadPath + front + end);
			
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		   
		   
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	
	
}
