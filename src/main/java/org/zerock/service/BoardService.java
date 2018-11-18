package org.zerock.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface BoardService {
	
	
	/*void regist(BoardVO vo) throws Exception;*/
	void regist(BoardVO vo, String userid) throws Exception;
	
	BoardVO read(int bno) throws Exception;
	void modify(BoardVO vo) throws Exception;
	void remove(int bno) throws Exception;
	List<BoardVO> listAll() throws Exception;
	
	// p 261
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	// p 280
	int listCountCriteria(Criteria cri) throws Exception;
	
	// p 331
	List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
	
	void hitUp(int bno);


}
