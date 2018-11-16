package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.iBoardDAO;

@Service
public class iBoardServiceImpl implements iBoardService{
	
	@Inject
	private iBoardDAO dao;

	@Override
	public void regist(BoardVO vo) throws Exception {
		this.dao.create(vo);
		// 1. 로그 남기는 객체 메소드
		// 2. 서비스 기능.. 
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return this.dao.read(bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		this.dao.update(vo);
	}

	@Override
	public void remove(int bno) throws Exception {
		this.dao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return this.dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return this.dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return this.dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return this.dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return this.dao.listSearchCount(cri);
	}


	@Override
	public void hitUp(int bno) {
		
		this.dao.plusViewcnt(bno);

	}

}
