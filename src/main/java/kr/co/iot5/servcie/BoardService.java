package kr.co.iot5.servcie;

import java.util.List;

import kr.co.iot5.domain.vo.BoardVO;

public interface BoardService {

	List<BoardVO> getArticles(BoardVO vo);

	BoardVO getArticle(BoardVO bvo);

	void writeArticle(BoardVO vo);

	int updateAriticle(BoardVO vo);

	int deleteArticle(BoardVO vo);

	int getAllCnt();

}
