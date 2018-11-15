package org.zerock.domain;

public class SearchCriteria extends Criteria{
	
	//private int page;        // 현재 페이지
	//private int perPageNum;  // 페이지당 수	
	private String searchType; // 검색조건
	private String keyword;    // 검색어
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
