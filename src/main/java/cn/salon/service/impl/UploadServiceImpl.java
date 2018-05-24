package cn.salon.service.impl;

import cn.salon.mapper.CustomerMapper;
import cn.salon.mapper.CustomerWalletMapper;
import cn.salon.mapper.WorkerMapper;
import cn.salon.pojo.Customer;
import cn.salon.pojo.Worker;
import cn.salon.service.UploadService;
import cn.salon.utils.ImportExcelToSqlUtil;
import cn.salon.utils.SResult;
import cn.salon.utils.UploadUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;

/**
 * POI文件上传实现
 * 
 * @ClassName: UploadServiceImpl
 * @Description: TODO
 * @author: super
 * @date: 2017年11月23日 下午4:49:44
 */
@Service
public class UploadServiceImpl implements UploadService {

	// 上传文件保存路径
	@Value("${UPLOAD_PATH}")
	private String UPLOAD_PATH;

	@Value("${password}")
	private String password;

	@Autowired
	private WorkerMapper workerMapper;
	@Autowired
	private CustomerMapper customerMapper;
	@Autowired
	private CustomerWalletMapper customerWalletMapper;
	// 能够上传的文件应该所包含的扩展名，用于限定上传文件类型
	private String[] params = { ".xlsx", ".xls" };

	@Override
	public SResult uploadWorkerFile(HttpServletRequest request, HttpServletResponse response, String saveFileName)
			throws Exception {
		UploadUtil uploadUtil = new UploadUtil();
		ImportExcelToSqlUtil importExcelToSqlUtil = new ImportExcelToSqlUtil();
		SResult result = uploadUtil.uploadFile(request, saveFileName, params, UPLOAD_PATH);
		// 获取上传的文件扩展名
		String fileExtName =  (String) request.getAttribute("fileExtName");
		// 获取上传的文件名
		saveFileName =  (String) request.getAttribute("saveFileName");
		int index = 2;
		String sign = "worker";
		String path = request.getSession().getServletContext().getRealPath("/") + UPLOAD_PATH;
		Map<String, List> map = new HashMap<>();
		if (params[0].equals(fileExtName)) {
			map = importExcelToSqlUtil.insertPOJOFromExcel07(request, response, index, path, saveFileName, sign);
		}
		if (params[1].equals(fileExtName)) {
			importExcelToSqlUtil.insertPOJOFromExcel03(request, response, index, path, saveFileName, sign);
		}
		Iterator<Entry<String, List>> iterator = map.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, List> entry = iterator.next();
			List list = entry.getValue();
			if(list == null || list.size()<=0) 
				break;
			Worker worker = new Worker();
			//补全职位ID信息
			worker.setEntryNo( list.get(0).toString());
			//补全用户名信息
			worker.setUsername( list.get(1).toString());
			//设置性别
			String sex =list.get(2).toString();
			if("男".equals(sex)) {
				worker.setSex("1");
			}else if("女".equals(sex)) {
				worker.setSex("0");
			}
			//补全昵称
			worker.setNickname( list.get(3).toString());
			//补全角色信息1:老板		2:经理	3:员工
			worker.setRole("3");

			//补全权限信息1：增加 2：删除 3:修改
			String authority = list.get(4).toString();
			StringBuffer sb = new StringBuffer(); 
			if(authority.contains("加")) {
				sb.append('1').append(",");
			}
			if(authority.contains("删")) {
				sb.append("2").append(",");
			}
			if(authority.contains("改")) {
				sb.append("3").append(",");
			}
			String str =  sb.toString();
			if(str.endsWith(",")) {
				str = str.substring(0, str.length()-1);
			}
			worker.setAuthority(str);
			//补全入职日期属性
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			//String time = simpleDateFormat.format(list.get(6).toString());
			Date date = simpleDateFormat.parse(list.get(5).toString());
			worker.setEntryDate(date);
			//补全家庭住址信息
			worker.setAddress( list.get(6).toString());
			//补全手机号信息
			worker.setMobile( list.get(7).toString());
			//补全邮箱信息
			worker.setEmail( list.get(8).toString());
			//设置职员当前状态  0:表示离职状态，1：表示任职状态
			String state = list.get(9).toString();
			if(StringUtils.isNotBlank(state)) {
				
				if(state.contains("离")) {
					worker.setState("0");
				}else {
					worker.setState("1");
				}
			}else {
				worker.setState("1");
			}
			//补全备注信息
			worker.setRemark( list.get(10).toString());
			//设置初始密码
			worker.setPassword(DigestUtils.md5DigestAsHex(worker.getUsername().getBytes()));
			//设置更新日期
			worker.setUpdateDate(new Date());
			workerMapper.insertSelective(worker);
			}
		return result;
	}
	
	@Override
	public SResult uploadCustomerFile(HttpServletRequest request, HttpServletResponse response, String saveFileName)
			throws Exception {
		UploadUtil uploadUtil = new UploadUtil();
		ImportExcelToSqlUtil importExcelToSqlUtil = new ImportExcelToSqlUtil();
		SResult result = uploadUtil.uploadFile(request, saveFileName, params, UPLOAD_PATH);
		// 获取上传的文件扩展名
		String fileExtName =  (String) request.getAttribute("fileExtName");
		// 获取上传的文件名
		saveFileName =  (String) request.getAttribute("saveFileName");
		int index = 2;
		String sign = "customer";
		String path = request.getSession().getServletContext().getRealPath("/") + UPLOAD_PATH;
		Map<String, List> map = new HashMap<>();
		if (params[0].equals(fileExtName)) {
			map = importExcelToSqlUtil.insertPOJOFromExcel07(request, response, index, path, saveFileName, sign);
		}
		if (params[1].equals(fileExtName)) {
			importExcelToSqlUtil.insertPOJOFromExcel03(request, response, index, path, saveFileName, sign);
		}
		Iterator<Entry<String, List>> iterator = map.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, List> entry = iterator.next();
			List list = entry.getValue();
			if(list == null || list.size()<=0) 
				break;
			Customer customer = new Customer();
			customer.setPayPwd(DigestUtils.md5DigestAsHex(password.getBytes()));
			//设置会员卡号信息
			customer.setCardNo(list.get(0).toString());
			//设置姓名
			customer.setUsername(list.get(1).toString());
			//设置性别
			String sex =list.get(2).toString();
			if("男".equals(sex)) {
				customer.setSex("1");
			}else if("女".equals(sex)) {
				customer.setSex("0");
			}
			//设置出生日期
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
			Date birthday = simpleDateFormat.parse(list.get(3).toString());
			customer.setBirthday(birthday);
			//设置手机号
			customer.setMobile(list.get(4).toString());
			//设置邮箱
			customer.setEmail(list.get(5).toString());
			//设置身份证号
			customer.setcIdCard(list.get(6).toString());
			//设置校园卡号
			customer.setCreditCard(list.get(7).toString());
			//设置院系
			customer.setCollege(list.get(8).toString());
			//设置年级
			customer.setGrade(list.get(9).toString());
			//设置备注信息
			customer.setRemark(list.get(10).toString());
			//设置初始密码
			customer.setPassword(DigestUtils.md5DigestAsHex(customer.getCardNo().getBytes()).toString());
			//设置创建日期
			customer.setCreateDate(new Date());
			//设置更新日期
			customer.setUpdateDate(new Date());
			//设置状态 0:停用   	1:启用
			customer.setState("1");
			//设置钱包余额
			customer.setWallet(new BigDecimal("0"));
			//设置消费金额
			customer.setPayMoney(new BigDecimal("0"));
			
			//插入会员详细信息数据操作
			customerMapper.insertSelective(customer);

			
		}
		return result;
	}

}
