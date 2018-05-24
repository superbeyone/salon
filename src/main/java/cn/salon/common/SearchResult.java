package cn.salon.common;

import java.io.Serializable;
import java.util.List;

public class SearchResult<T> implements Serializable{

	private long recordCount;
	private int totalPages;
	private List<T> itemList;
	public long getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(long recordCount) {
		this.recordCount = recordCount;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public List<T> getItemList() {
		return itemList;
	}
	public void setItemList(List<T> itemList) {
		this.itemList = itemList;
	}
	
	
}
