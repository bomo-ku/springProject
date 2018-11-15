package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface BoardDAO {
	
	void create(BoardVO vo) throws Exception;
	BoardVO read(int bno) throws Exception;
	void update(BoardVO vo) throws Exception;
	void delete(int bno) throws Exception;
	List<BoardVO> listAll() throws Exception;
	
	// p 249
	List<BoardVO> listPage(int page) throws Exception;
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	int countPaging(Criteria cri) throws Exception;

	// p 323
	List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
	void plusViewcnt(int bno);
}
