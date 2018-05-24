package cn.salon.common;

import java.io.Serializable;
import java.util.List;

public class EasyUIDataGridResult implements Serializable {
	private long currentPage;
	private int totalPages;
	private long total;
	private List rows;
	
	
	public long getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(long currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	
	
}
