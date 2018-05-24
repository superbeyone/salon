package cn.salon.common;

import java.io.Serializable;

public class LayResult implements Serializable {
	private int code;
	private int count;
	private Object data;
	private String msg;

	
	
	public LayResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LayResult(int code, int count, Object data, String msg) {
		this.code = code;
		this.count = count;
		this.data = data;
		this.msg = msg;
	}

	public static LayResult ok(int count, Object data) {
		return new LayResult(count, data);
	}

	public static LayResult ok() {
		return new LayResult((Integer) null,null);
	}
	public LayResult(int count, Object data) {
		this.code = 200;
		this.count = count;
		this.data = data;
		this.msg = "ok";
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
