package cn.salon.utils;

import java.util.ResourceBundle;

public class ResourceUtil {

	private static final ResourceBundle bundle = ResourceBundle.getBundle("sysConfig");
    /**
     * 获取随机码的长度
     *
     * @return 随机码的长度
     */
    public static String getRandCodeLength() {
        return bundle.getString("randCodeLength");
    }

    /**
     * 获取随机码的类型
     *
     * @return 随机码的类型
     */
    public static String getRandCodeType() {
        return bundle.getString("randCodeType");
    }

}
