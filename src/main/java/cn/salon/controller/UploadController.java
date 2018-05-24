package cn.salon.controller;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import cn.salon.service.UploadService;
import cn.salon.utils.SResult;

@Controller
public class UploadController {
	
	@Autowired
	private UploadService uploadService;
	//职员详情表实现上传功能
	@RequestMapping(value="/upload/workerInfo")
	@ResponseBody
	public SResult uploadWorkerInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String saveFileName = "workerExcel";
		uploadService.uploadWorkerFile(request,response,saveFileName);
		response.sendRedirect(request.getContextPath()+"/worker/list.html");
		//request.getRequestDispatcher("/worker/list");
    return SResult.ok(); 
	}
    
    @RequestMapping(value="/upload/customerInfo")
    @ResponseBody
    public SResult uploadCustomerInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
    	String saveFileName = "customerExcel";
    	uploadService.uploadCustomerFile(request,response,saveFileName);
    	response.sendRedirect(request.getContextPath()+"/customer/list.html");
    	//request.getRequestDispatcher("/worker/list");
    	return SResult.ok(); 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//uploadService.uploadWorker(request, response);
//		UploadUtil up = new UploadUtil();
//		String savePath = request.getSession().getServletContext().getRealPath("/")+"WEB-INF/upload/excel";
////		
//		String fileName = "excel.xlsx";
//		String[] params = {".jpg",".mp4",".xlsx"};
//		up.uploadFile(request, response,savePath,fileName,params);
//	
		//FileInputStream fileInputStream = new FileInputStream(new File(""));
		//return SResult.ok();
//		File srcFile = new File(url);
//		File destFile = new File(savePath+fileName);
//		FileUtils.copyFile(srcFile, destFile);
//		boolean multipartContent = ServletFileUpload.isMultipartContent(request);
//		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
//		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
//		//long id = worker.getId();
//		Object uploadFile = upl.getUploadFile();
//		List<FileItem> items = servletFileUpload.parseRequest(request);
//		for (FileItem fileItem : items) {
//			if(!fileItem.isFormField() || fileItem!=null) {
//				System.out.println(fileItem.getName());
//			}
//		}
		
		
		
		
		
		
		
	}
	
}


