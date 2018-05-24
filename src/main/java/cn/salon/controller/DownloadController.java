package cn.salon.controller;

import cn.salon.utils.DownloadUtil;
import cn.salon.utils.SResult;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class DownloadController {

	@Value("${exportCustomerName}")
	String exportCustomerName;
	@Value("${exportWorkerName}")
	String exportWorkerName;

	@RequestMapping(value="/download/workerTemplet")
	@ResponseBody
	public SResult downloadWorkerTemplet(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("/")+"templet/xlsprint";
		String fileName = "workerTemplet.xlsx";
		String saveName = "职员信息添加模板.xlsx";
		String filePath = path+"/"+fileName;
		File file = new File(filePath);
		DownloadUtil downloadUtil = new DownloadUtil();
		downloadUtil.prototypeDownload(file, saveName, response, false);
		return SResult.ok();
	}
	@RequestMapping(value="/download/customerTemplet")
	@ResponseBody
	public SResult downloadCustomerTemplet(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("/")+"templet/xlsprint";
		String fileName = "customerTemplet.xlsx";
		String saveName = "会员信息添加模板.xlsx";
		String filePath = path+"/"+fileName;
		File file = new File(filePath);
		DownloadUtil downloadUtil = new DownloadUtil();
		downloadUtil.prototypeDownload(file, saveName, response, false);
		return SResult.ok();
	}

	@RequestMapping("/download/exportCustomers")
	@ResponseBody
	public SResult downloadCustomerList(HttpServletRequest request,HttpServletResponse response){
		try {
			toDownload(request, response, exportCustomerName.getBytes("iso8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return SResult.ok();
	}
	@RequestMapping("/download/exportWorkers")
	@ResponseBody
	public SResult downloadWorkers(HttpServletRequest request,HttpServletResponse response){
		try {
			toDownload(request, response, exportWorkerName.getBytes("iso8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return SResult.ok();
	}

	private void toDownload(HttpServletRequest request, HttpServletResponse response, byte[] bytes) {
		String fileName = null;
		try {
			fileName = new String(bytes, "utf8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String filePath = request.getSession().getServletContext().getRealPath("") + fileName + ".xls";
		File file = new File(filePath);
		DownloadUtil downloadUtil = new DownloadUtil();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String formatTime = simpleDateFormat.format(new Date());
		downloadUtil.prototypeDownload(file, fileName + formatTime + ".xls", response, false);
	}

}
