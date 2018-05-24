package cn.salon.service.impl;

import cn.salon.common.EasyUIDataGridResult;
import cn.salon.common.LayResult;
import cn.salon.dto.WorkerDto;
import cn.salon.filter.RequestHolder;
import cn.salon.mapper.WorkerMapper;
import cn.salon.pojo.Worker;
import cn.salon.pojo.WorkerExample;
import cn.salon.pojo.WorkerExample.Criteria;
import cn.salon.service.WorkerService;
import cn.salon.utils.ExportBeanExcel;
import cn.salon.utils.SResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 职员Service
 *
 * @ClassName: WorkerServiceImpl
 * @Description: TODO
 * @author: super
 * @date: 2017年11月20日 下午12:52:37
 */
@Service
public class WorkerServiceImpl implements WorkerService {
    @Autowired
    WorkerMapper workerMapper;

    @Value("${exportWorkerName}")
    String exportWorkerName;
    @Value("${password}")
    String password;


    @Override
    public SResult addWorkerInfo(Worker worker) throws Exception {

        String md5Password = DigestUtils.md5DigestAsHex(password.getBytes()).toString();
        if(StringUtils.isBlank(worker.getNickname())){
            worker.setNickname(worker.getUsername());
        }
        worker.setPassword(md5Password);

        worker.setUpdateDate(new Date());
        //0:停用	1:启用
        worker.setState(1 + "");
        int i = workerMapper.insertSelective(worker);

        if (i > 0) {
            return SResult.build(200, "添加成功");
        }
        return SResult.build(300, "添加失败");
    }


    @Override
    public EasyUIDataGridResult getWorkerList() {

        //执行查询
        WorkerExample example = new WorkerExample();
        List<Worker> list = workerMapper.selectByExample(example);
        //创建一个返回结果的对象
        EasyUIDataGridResult result = new EasyUIDataGridResult();
        result.setRows(list);
        PageInfo<Worker> pageInfo = new PageInfo<>(list);
        //获得查询结果的总记录数
        //long total = pageInfo.getTotal();
        //result.setCurrentPage(page);
        //int totalPage = (int) ((total%rows)==0?(total/rows):(total/rows)+1);
        //result.setTotalPages(totalPage);
        //result.setTotal(total);
        //取分页结果
        return result;
    }

    @Override
    public LayResult getWorkerList(int page, int rows) {
        PageHelper.startPage(page, rows);
        WorkerExample example = new WorkerExample();
        Criteria criteria = example.createCriteria();
        criteria.andRoleNotEqualTo("1");
        criteria.andStateEqualTo("1");

        List<Worker> list = workerMapper.selectByExample(example);
        int count = workerMapper.countByExample(example);
        LayResult result = new LayResult(count, list);

//		PageInfo<Worker> pageInfo = new PageInfo<>(list);
//		//取总记录数
//		long total = pageInfo.getTotal();
//		result.setTotal(total);
        return result;
    }

    @Override
    public boolean getWorkerByUsername(String username) {
        WorkerExample example = new WorkerExample();
        Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andStateEqualTo("1");
        List<Worker> list = workerMapper.selectByExample(example);
        if (list.size() > 0) {

            return false;
        }
        return true;
    }


    @Override
    public Worker getWorkerById(int id) {
        Worker worker = workerMapper.selectByPrimaryKey(id);
        return worker;
    }

    @Override
    public SResult updateWorkerInfo(Worker worker) {

        int i = workerMapper.updateByPrimaryKeySelective(worker);

        HttpServletRequest request = RequestHolder.getCurrentRequest();
        Worker user = (Worker) request.getSession().getAttribute("user");

        if (i == 1) {
            if(user.getId() == worker.getId()){

                request.getSession().setAttribute("user",workerMapper.selectByPrimaryKey(worker.getId()));
            }
            return SResult.build(200, "更新成功");
        } else {
            return SResult.build(300, "操作失败");
        }
    }

    @Override
    public void deleteWorkerById(int id) {
        Worker worker = workerMapper.selectByPrimaryKey(id);
        worker.setState("0");
        workerMapper.updateByPrimaryKeySelective(worker);
    }

    @Override
    public void exportWorkerByIds(String workerIds, HttpServletRequest request) {
        String[] strings = StringUtils.split(workerIds, ",");
        WorkerExample workerExample = new WorkerExample();

        Criteria criteria = workerExample.createCriteria();
        ArrayList<Integer> ids = new ArrayList<>();
        for (String id : strings) {
            ids.add(Integer.parseInt(id));
        }
        criteria.andIdIn(ids);
        List<Worker> workerList = workerMapper.selectByExample(workerExample);
        if (workerList.size() > 0) {
            ArrayList<WorkerDto> workerDtoList = new ArrayList<>();
            ArrayList<String> fieldTitle = new ArrayList<>();
            fieldTitle.add("会员卡号");
            fieldTitle.add("姓名");
            fieldTitle.add("性别");
            fieldTitle.add("入职日期");
            fieldTitle.add("手机");
            fieldTitle.add("邮箱");
            fieldTitle.add("家庭住址");

            ArrayList<String> field = new ArrayList<>();
            field.add("entryNo");
            field.add("username");
            field.add("sex");
            field.add("entryDate");
            field.add("mobile");
            field.add("email");
            field.add("address");

            for (int i = 0; i < workerList.size(); i++) {
                WorkerDto workerDto = new WorkerDto();
                Worker worker = workerList.get(i);
                workerDto.setEntryNo(worker.getEntryNo());
                workerDto.setUsername(worker.getNickname());
                workerDto.setSex(worker.getSex().equals("1") ? "男" : "女");
                if (worker.getEntryDate() == null) {
                    workerDto.setEntryDate("");
                } else {
                    String format = new SimpleDateFormat("yyyy-MM-dd").format(worker.getEntryDate());
                    workerDto.setEntryDate(format);
                }
                workerDto.setMobile(worker.getMobile() == null ? "" : worker.getMobile());
                workerDto.setEmail(worker.getEmail() == null ? "" : worker.getEmail());
                workerDto.setAddress(worker.getAddress() == null ? "" : worker.getAddress());

                workerDtoList.add(workerDto);
            }
            ExportBeanExcel<WorkerDto> exportBeanExcel = new ExportBeanExcel<>();
            String filePath = request.getSession().getServletContext().getRealPath("");

            filePath += exportWorkerName;

            String exportFileName = exportBeanExcel.exportExcel(filePath, null, fieldTitle, field, workerDtoList);
            request.setAttribute("exportFileName", exportFileName);

        }

    }

    @Override
    public boolean getWorkerByEntryNo(String entryNo) {
        WorkerExample workerExample = new WorkerExample();
        Criteria criteria = workerExample.createCriteria();
        criteria.andEntryNoEqualTo(entryNo);
        List<Worker> workerList = workerMapper.selectByExample(workerExample);
        if (workerList.size() > 0) {
            return false;
        }
        return true;
    }

    @Override
    public LayResult getRecycleWorker(int page, int limit, String search) {
        PageHelper.startPage(page, limit);
        WorkerExample example = new WorkerExample();
        Criteria criteria = example.createCriteria();
        criteria.andStateEqualTo("0");
        List<Worker> list = workerMapper.selectByExample(example);
        int count = workerMapper.countByExample(example);
        LayResult result = new LayResult(count, list);
        return result;
    }

    @Override
    public SResult deleteWorkerActuallyById(int id) {


        workerMapper.deleteByPrimaryKey(id);
        return SResult.build(200, "删除成功");
    }

    @Override
    public SResult rollbackWorkerById(int id) {
        Worker worker = workerMapper.selectByPrimaryKey(id);
        worker.setState("1");
        workerMapper.updateByPrimaryKeySelective(worker);
        return SResult.ok();
    }

    @Override
    public SResult updateWorkerLoginPwd(HttpServletRequest request, String oldPwd, String newPwd) {
        if (oldPwd.equals(newPwd)) {
            return SResult.build(200, "修改成功");
        }
        HttpSession session = request.getSession();
        Worker w = (Worker) session.getAttribute("user");
        Worker worker = workerMapper.selectByPrimaryKey(w.getId());
        String oldPwdMd5 = DigestUtils.md5DigestAsHex(oldPwd.getBytes()).toString();
        if (!worker.getPassword().equals(oldPwdMd5)) {
            return SResult.build(300, "原密码输入错误，修改失败");
        }
        String newPwdMd5 = DigestUtils.md5DigestAsHex(newPwd.getBytes()).toString();
        worker.setPassword(newPwdMd5);
        workerMapper.updateByPrimaryKeySelective(worker);
        return SResult.build(200, "修改成功");
    }
}
