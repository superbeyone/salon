package cn.salon.controller;

import cn.salon.common.LayResult;
import cn.salon.pojo.Worker;
import cn.salon.service.WorkerService;
import cn.salon.utils.JsonUtils;
import cn.salon.utils.SResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class WorkerController {
	
	@Autowired
	private WorkerService workerService;
	
	/**
	 * 展示添加用户信息页面
	 * @Title: addWorker
	 * @Description: TODO
	 * @return
	 * @return: String
	 */
	@RequestMapping(value="/worker/addWorker")
	public String addWorker() {
		return "/worker/addWorker";
	}
	
	/**
	 * 显示用户信息页面，用户查询
	 * @Title: showWorker
	 * @Description: TODO
	 * @return
	 * @return: String
	 */
	@RequestMapping(value="/worker/list")
	public String showWorkers() {

		return "/worker/workList";
	}
	@RequestMapping(value="/worker/changePwd.html")
	public String changePwd() {

		return "/worker/workerPwd";
	}
	@RequestMapping("/worker/workerList")
	@ResponseBody
	public String workerList(@RequestParam(value="page",defaultValue = "1") int page,@RequestParam(value="limit",defaultValue = "10") int limit){
		LayResult result = workerService.getWorkerList(page,limit);
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	@RequestMapping(value="/worker/workerInfo.html")
	public String showWorkerInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Worker w = (Worker) session.getAttribute("user");
		Worker worker = workerService.getWorkerById(w.getId());
		request.setAttribute("worker", worker);
		return "/worker/workerInfo";
	}

	//添加职员信息
	@RequestMapping(value="/worker/addValidateWorker.action", method=RequestMethod.POST)
	@ResponseBody
	public SResult addValidateWorker(Worker worker,@RequestParam("entryDateStr")String entryDateStr, HttpServletRequest request) throws Exception {
		if(StringUtils.isBlank(entryDateStr)){
			worker.setEntryDate(null);
		}else{
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date entryDate = simpleDateFormat.parse(entryDateStr);
			worker.setEntryDate(entryDate);
		}

		return workerService.addWorkerInfo(worker);
	}
	
	//更新职员信息
	@RequestMapping(value="/worker/updateWorkerInfo")
	public String updateWorkerInfo(Worker worker,@RequestParam("entryDateStr")String entryDateStr,Model model) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date entryDate = simpleDateFormat.parse(entryDateStr);
		worker.setEntryDate(entryDate);
		SResult result = workerService.updateWorkerInfo(worker);
		model.addAttribute("result", result);
		return "/common/info";
	}
	@RequestMapping(value="/worker/updateWorker")
	@ResponseBody
	public SResult updateWorker(Worker worker,@RequestParam("entryDateStr")String entryDateStr,Model model) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date entryDate = simpleDateFormat.parse(entryDateStr);
		worker.setEntryDate(entryDate);
		SResult result = workerService.updateWorkerInfo(worker);
		return result;
	}
	//查看职员信息
	@RequestMapping(value="/worker/viewWorker")
	public String viewCustomer(@RequestParam(value="id") int id,Model model) {
		Worker worker = workerService.getWorkerById(id);
		model.addAttribute("worker", worker);
		return "/worker/viewWorker";
	}
	//修改职员信息
	@RequestMapping(value="/worker/editWorker")
	public String editCustomer(@RequestParam(value="id") int id,Model model) {
		Worker worker = workerService.getWorkerById(id);
		model.addAttribute("worker", worker);
		return "/worker/editWorker";
	}

	@RequestMapping(value = "/worker/deleteWorker")
	@ResponseBody
	public void deleteWorker(@RequestParam("id") int id){
		workerService.deleteWorkerById(id);
	}

	//导出职员信息
	@RequestMapping("/exportWorkerIds.action")
	@ResponseBody
	public SResult exportCustomerByIds(String workerIds, HttpServletRequest request){
		workerService.exportWorkerByIds(workerIds,request);
		String exportFileName = (String) request.getAttribute("exportFileName");

		if (StringUtils.isNotBlank(exportFileName)) {

			return SResult.build(200, "导出成功");
		}
		return SResult.build(300,"系统繁忙");
	}

	@RequestMapping("/worker/getWorkerByEntryNo.action")
	@ResponseBody
	public SResult getWorkerByEntryNo(String entryNo){
		boolean result = workerService.getWorkerByEntryNo(entryNo);
		if(result == true){
			return SResult.build(200,"该编号可用");
		}
		return SResult.build(300,"该编号已存在");
	}


	@RequestMapping("/worker/recycleWorker.html")
	public String recycleWorker(){
		return "/recycle/workList";
	}

	@RequestMapping("/worker/getRecycleWorker.action")
	@ResponseBody
	public String getRecycleWorker(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int limit, @RequestParam(value = "search", defaultValue = "") String search, Model model){
		LayResult result =workerService.getRecycleWorker(page,limit,search);
		String json = JsonUtils.objectToJson(result);
		return json;
	}

	@RequestMapping("/worker/deleteWorkerActually.action")
	@ResponseBody
	public SResult deleteWorkerActually(int id){
		return workerService.deleteWorkerActuallyById(id);
	}
	@RequestMapping("/worker/rollbackWorker.action")
	@ResponseBody
	public SResult rollbackWorker(int id){
		return workerService.rollbackWorkerById(id);
	}

	@RequestMapping("/worker/updateWorkerLoginPwd.action")
	@ResponseBody
	public SResult updateWorkerLoginPwd(HttpServletRequest request,@RequestParam("oldPwd")String oldPwd,@RequestParam("newPwd")String newPwd){

		return workerService.updateWorkerLoginPwd(request,oldPwd, newPwd);
	}

	@RequestMapping("/worker/getWorkerByUsername.action")
	@ResponseBody
	public SResult getWorkerByUserName(String username){
		boolean result = workerService.getWorkerByUsername(username);
		if(result == true){
			return SResult.build(200,"该用户名可用");
		}
		return SResult.build(300,"该用户名已存在");
	}

}
