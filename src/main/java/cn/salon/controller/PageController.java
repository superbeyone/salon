package cn.salon.controller;

import cn.salon.filter.RequestHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 显示首页
 * 
 * @ClassName: ShowIndexPage
 * @Description: TODO
 * @author: super
 * @date: 2017年11月19日 下午5:58:16
 */
@Controller
public class PageController {



	@RequestMapping(value = "index")
	public String showIndexPage() {
		return "index2";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//清除session
		session.invalidate();
		RequestHolder.remove();
		//request.getRequestDispatcher("/toLogin.html").forward(request, response);
		//response.sendRedirect("/salon/toLogin.html");
		//return "redirect:/common/login.html";
		return "redirect:/login.html";
	}


	
	
}
