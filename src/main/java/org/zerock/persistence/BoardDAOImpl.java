package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace =
			"org.zerock.mapper.BoardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}

	@Override
	public BoardVO read(int bno) throws Exception {		
		return session.selectOne(namespace+".read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception { 
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<BoardVO> listPage( 
			@RequestParam( value="page", defaultValue="1") int page) throws Exception {
		return this.session.selectList(namespace + ".listPage", page) ;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		System.out.println(">>>> cri.getPage() : " + cri.getPage());
		return this.session.selectList(namespace + ".listCriteria", cri) ;
	}
	
	// p 280
	@Override
	public int countPaging( Criteria cri) throws Exception{
		return this.session.selectOne(namespace +".countPaging", cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {		
		return this.session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {		
		return this.session.selectOne(namespace+".listSearchCount", cri);
	}

	@Override
	public void plusViewcnt(int bno) {
		session.update(namespace + ".plusViewcnt", bno);
		
	}

}
