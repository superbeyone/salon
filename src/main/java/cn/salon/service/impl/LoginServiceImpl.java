package cn.salon.service.impl;

import cn.salon.mapper.WorkerMapper;
import cn.salon.pojo.Worker;
import cn.salon.pojo.WorkerExample;
import cn.salon.pojo.WorkerExample.Criteria;
import cn.salon.service.LoginService;
import cn.salon.utils.SResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.List;
import java.util.Random;

/**
 * 登录处理
 * 
 * @ClassName: LoginServiceImpl
 * @Description: TODO
 * @author: super
 * @date: 2017年11月21日 下午2:20:57
 */
@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private WorkerMapper workerMapper;

	@Override
	public SResult login(String username, String password) {

		String md5password = DigestUtils.md5DigestAsHex(password.getBytes()).toString();
		WorkerExample example = new WorkerExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andStateEqualTo("1");
		List<Worker> list = workerMapper.selectByExample(example);
		if (list == null || list.size() <= 0) {
			return SResult.build(300, "账号或者密码错误");
		}
		Worker worker = list.get(0);
		if (!md5password.equals(worker.getPassword())) {
			return SResult.build(300, "账号或者密码错误");
		}
		
		worker.setPassword(null);
		
		return SResult.ok(worker);

	}

	@Override
	public BufferedImage createVerifyCode(HttpServletRequest request) {

		int width = 80;
		int height = 32;
		//create the image
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		// set the background color
		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, width, height);
		// draw the border
		g.setColor(Color.black);
		g.drawRect(0, 0, width - 1, height - 1);
		// create a random instance to generate the codes
		Random rdm = new Random();
		// make some confusion
		for (int i = 0; i < 50; i++) {
			int x = rdm.nextInt(width);
			int y = rdm.nextInt(height);
			g.drawOval(x, y, 0, 0);
		}
		// generate a random code
		String verifyCode = generateVerifyCode(rdm);
		g.setColor(new Color(0, 100, 0));
		g.setFont(new Font("Candara", Font.BOLD, 24));
		g.drawString(verifyCode, 8, 24);
		g.dispose();
		int rnd = calc(verifyCode);
		HttpSession session = request.getSession();
		session.setAttribute("verifyCode",rnd);
		//输出图片
		return image;

	}

	private static int calc(String exp) {
		try {
			ScriptEngineManager manager = new ScriptEngineManager();
			ScriptEngine engine = manager.getEngineByName("JavaScript");
			return (Integer)engine.eval(exp);
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	private static char[] ops = new char[] {'+', '-', '*'};

	private String generateVerifyCode(Random rdm) {
		int num1 = rdm.nextInt(10);
		int num2 = rdm.nextInt(10);
		int num3 = rdm.nextInt(10);
		char op1 = ops[rdm.nextInt(3)];
		char op2 = ops[rdm.nextInt(3)];
		String exp = ""+ num1 + op1 + num2 + op2 + num3;
		return exp;
	}


}
