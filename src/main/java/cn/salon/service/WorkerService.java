package cn.salon.service;

import cn.salon.common.EasyUIDataGridResult;
import cn.salon.common.LayResult;
import cn.salon.pojo.Worker;
import cn.salon.utils.SResult;

import javax.servlet.http.HttpServletRequest;

public interface WorkerService  {
	
	 SResult addWorkerInfo(Worker worker)throws Exception;
	
	 EasyUIDataGridResult getWorkerList();
	
	 LayResult getWorkerList(int page, int rows);
	
	 boolean getWorkerByUsername(String username);

	 Worker getWorkerById(int id);

    SResult updateWorkerInfo(Worker worker);

	void deleteWorkerById(int id);

    void exportWorkerByIds(String workerIds, HttpServletRequest request);

	boolean getWorkerByEntryNo(String entryNo);

    LayResult getRecycleWorker(int page, int limit, String search);

	SResult deleteWorkerActuallyById(int id);

    SResult rollbackWorkerById(int id);

    SResult updateWorkerLoginPwd(HttpServletRequest request,String oldPwd, String newPwd);
}
