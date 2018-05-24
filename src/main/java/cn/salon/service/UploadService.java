package cn.salon.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.salon.utils.SResult;

public interface UploadService {
	public SResult uploadWorkerFile(HttpServletRequest request, HttpServletResponse response, String saveFileName) throws Exception;
	
	public SResult uploadCustomerFile(HttpServletRequest request, HttpServletResponse response, String saveFileName) throws Exception;
	
}
