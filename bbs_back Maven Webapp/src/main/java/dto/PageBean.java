package dto;

import java.io.Serializable;

public class PageBean implements Serializable {
	//当前页号
	private Integer page;
	//每页多少条
	private Integer rows;
	//总条数
	private Integer total;
	//排序字段
	private String sort;
	//排序方式
	private String order;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	
	public Integer getStartRow() {
		return (page-1)*rows;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageBean(Integer page, Integer rows, Integer total, String sort,
			String order) {
		super();
		this.page = page;
		this.rows = rows;
		this.total = total;
		this.sort = sort;
		this.order = order;
	}
	@Override
	public String toString() {
		return "PageBean [page=" + page + ", rows=" + rows + ", total=" + total
				+ ", sort=" + sort + ", order=" + order + "]";
	}
	
	
}
