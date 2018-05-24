package cn.salon.filter;

import cn.salon.pojo.Worker;

import javax.servlet.http.HttpServletRequest;

/**
 * @author super
 * @create 2018-03-24 14:47
 */

public class RequestHolder {
    private static final ThreadLocal<Worker>  userHolder = new ThreadLocal<>();
    private static final ThreadLocal<HttpServletRequest>  requestHolder = new ThreadLocal<>();

    public static void add(Worker worker){
        userHolder.set(worker);
    }

    public static void add(HttpServletRequest request){
        requestHolder.set(request);
    }

    public static Worker getCurrentUser(){
        return userHolder.get();
    }

    public static HttpServletRequest getCurrentRequest(){
        return requestHolder.get();
    }

    public static void remove(){
        userHolder.remove();
        requestHolder.remove();
    }

}
