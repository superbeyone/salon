package cn.salon.utils;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class UploadUtil {
	
	/**
	 * @Title: uploadFile
	 * @Description: TODO
	 * @param request
	 * @param saveFileName	保存的文件名
	 * @param params 	能够上传的文件应该所包含的扩展名，用于限定上传文件类型
	 * @param uploadPath 上传文件保存路径
	 * @return
	 * @throws Exception
	 * @return: SResult
	 */
	public SResult uploadFile(HttpServletRequest request,String saveFileName,String[] params,String uploadPath) throws Exception {
		
		 long  startTime=System.currentTimeMillis();
         //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
           //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();
             
            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                	//获取文件的后缀名带.
                	String fileExtName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
                	request.setAttribute("fileExtName", fileExtName);
                	if(params!=null){
						int count = 0;
						int sum = params.length;
						for (int i = 0; i < params.length; i++) {
							String string = params[i];
							if(!fileExtName.equals(string)){
								count++;
								if(count == sum){
									return SResult.build(400, "文件格式错误");
								}
								continue;
								
							}else{
								break;
							}
							
						}
					}
                    String path=request.getSession().getServletContext().getRealPath("/")+uploadPath;
                    if(StringUtils.isNotBlank(saveFileName)) {
                    	//如果saveFileName传值的话，保存的文件名为传值名称
                    	saveFileName = saveFileName+fileExtName;
                    }else {
                    	//如果不传值得话，保存文件名称为上传名称
                    	saveFileName = file.getOriginalFilename();
                    }
                    request.setAttribute("saveFileName", saveFileName);
                    //上传
                    file.transferTo(new File(path+saveFileName));
                }
                 
            }
           
        }
        long  endTime=System.currentTimeMillis();
        //System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
		
		return SResult.ok();
	}
}
