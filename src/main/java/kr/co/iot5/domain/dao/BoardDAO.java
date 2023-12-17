package kr.co.iot5.domain.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.iot5.domain.vo.BoardVO;

@Mapper
public interface BoardDAO {

	List<BoardVO> getArticles(BoardVO vo);

	BoardVO getArticle(BoardVO bvo);

	void updateReadCount(BoardVO bvo);

	void writeArticle(BoardVO bvo);

	int updateAriticle(BoardVO bvo);

	int deleteArticle(BoardVO bvo);

	int getAllCnt();

}
