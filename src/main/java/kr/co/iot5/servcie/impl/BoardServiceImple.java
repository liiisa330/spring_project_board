package kr.co.iot5.servcie.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.iot5.domain.dao.BoardDAO;
import kr.co.iot5.domain.vo.BoardVO;
import kr.co.iot5.servcie.BoardService;

@Service("boardService")
public class BoardServiceImple implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getArticles(BoardVO vo) {
		return boardDAO.getArticles(vo);
	}

	@Override
	public BoardVO getArticle(BoardVO bvo) {
		boardDAO.updateReadCount(bvo);
		return boardDAO.getArticle(bvo);
	}

	@Override
	public void writeArticle(BoardVO bvo) {
		boardDAO.writeArticle(bvo);
	}

	@Override
	public int updateAriticle(BoardVO vo) {
		return boardDAO.updateAriticle(vo);
	}

	@Override
	public int deleteArticle(BoardVO vo) {
		return boardDAO.deleteArticle(vo);
	}

	@Override
	public int getAllCnt() {
		return boardDAO.getAllCnt();
	}

}
