package com.upload.utils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class UploadImage {
	

	HttpServletRequest req;
	MultipartFile file;
	
	public void upImage(HttpServletRequest request,@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException
	{
		String id = UUID.randomUUID().toString().replace("-", "");
		Map<String,Object> map=new HashMap<String, Object>();
		Map<String, Object> data=new HashMap<String, Object>();
		String realPath=request.getSession().getServletContext().getRealPath("upload/");
		System.out.println("Í¼Æ¬µÄÂ·¾¶"+realPath+"/"+id+file.getOriginalFilename());
		File transferFile=new File(realPath+"/"+id+file.getOriginalFilename());
		file.transferTo(transferFile);
	}
	public static void main(String[] args) {
		//UploadImage(req,file);
	}
	
}
