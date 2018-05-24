package cn.salon.service;



import cn.salon.utils.SResult;

import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;

public interface LoginService {
	SResult login(String username, String password);

	BufferedImage createVerifyCode(HttpServletRequest request);
}
