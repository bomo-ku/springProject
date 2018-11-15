package org.zerock.domain;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	public Criteria() { 
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page <=0 ? 1 : page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum <=0 || perPageNum > 100 ? 10 : perPageNum;
	}
	
	// method for Mybatis SQL Mapper
	public int getPageBeginning() {
		return (this.page-1) * this.perPageNum+1;
	}
	public int getPageEnd() {
		return this.page * this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	

}
