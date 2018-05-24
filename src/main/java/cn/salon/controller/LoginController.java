package cn.salon.controller;

import cn.salon.filter.RequestHolder;
import cn.salon.pojo.Worker;
import cn.salon.service.LoginService;
import cn.salon.utils.SResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;


    @RequestMapping(value = "/login.html")
    public String showLoginPage() {

        return "/common/login";
    }


    @RequestMapping(value = "/do_login")
    @ResponseBody
    public SResult login(HttpSession session, String username, String password, String verifyCode, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestHolder.remove();
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            return SResult.build(300, "用户名或密码不能为空");

        }
        if(StringUtils.isBlank(verifyCode)){
            return SResult.build(300, "验证码不能为空");
        }

        int code = (int) session.getAttribute("verifyCode");

        if (!(code+"").equals(verifyCode)) {

            return SResult.build(300, "验证码错误");
        }
            SResult result = loginService.login(username, password);
            //如果登录成功
            if (result.getStatus() == 200) {
                //String token = (String) sresult.getData();
                //session.setAttribute("username", username);
                Worker worker = (Worker) result.getData();
                session.setAttribute("user",worker);
                session.setMaxInactiveInterval(1800);
               // CookieUtils.setCookie(request, response, "token", token, 1800, true);

                return SResult.build(200, "登录成功");
            }
        return SResult.build(300, "用户名或密码错误");

    }



    @RequestMapping("/verifyCode.action")
    @ResponseBody
    public void verifyCode(HttpServletRequest request, HttpServletResponse response) {
        BufferedImage image = loginService.createVerifyCode(request);

        try {
            ServletOutputStream outputStream = response.getOutputStream();
            ImageIO.write(image, "JPEG", outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

}
