package cn.salon.interceptor;

import cn.salon.filter.RequestHolder;
import cn.salon.pojo.Worker;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器
 *
 * @ClassName: LoginInceptor
 * @Description: TODO
 * @author: super
 * @date: 2017年11月21日 下午5:55:13
 */
public class HttpInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();

        Worker user = (Worker) session.getAttribute("user");
        if (uri.contains("login") || uri.contains("verify"))
            return true;
        if(user!=null ){
                RequestHolder.add(request);
                RequestHolder.add(user);
        }else{
            request.getRequestDispatcher("/login.html").forward(request, response);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }


}
