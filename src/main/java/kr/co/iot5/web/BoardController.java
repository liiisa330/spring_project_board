package kr.co.iot5.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iot5.domain.vo.BoardVO;
import kr.co.iot5.domain.vo.PageInfo;
import kr.co.iot5.domain.vo.PageVO;
import kr.co.iot5.servcie.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardServce;
	
	@RequestMapping(value="/")
	public String Root() {
		logger.info("루트 들어옴");
		return "redirect:list";
	}
	
	@RequestMapping("list")
	public String list(HttpServletRequest request, HttpServletResponse response, BoardVO vo,
			           Model model, PageVO pvo) {
		
		//페이지 만드는 서비스 호출. 그 서비는 페이지 계산하고 리턴
		pvo.setAllCnt(boardServce.getAllCnt());
		if(pvo.getCurPage()==0)pvo.setCurPage(1);
		if(pvo.getCurBlock()==0)pvo.setCurBlock(1);
		if(pvo.getAllCnt()%PageInfo.PAGE_PER_NEXT==0)
          pvo.setBlockCnt(pvo.getAllCnt()/PageInfo.PAGE_PER_NEXT);
		else pvo.setBlockCnt(pvo.getAllCnt()/PageInfo.PAGE_PER_NEXT+1);		
		
		//현재 페이지 계산해서 시작행과 끝행. 계산
		int start = (pvo.getCurPage()-1)*PageInfo.ROW_PER_PAGE +1;
		int end = pvo.getCurPage()*PageInfo.ROW_PER_PAGE;
		if(pvo.getAllCnt()%PageInfo.ROW_PER_PAGE==0)
		   pvo.setPageCnt(pvo.getAllCnt()/PageInfo.ROW_PER_PAGE);
		else
			pvo.setPageCnt(pvo.getAllCnt()/PageInfo.ROW_PER_PAGE+1);
		vo.setStartRow(start);
		vo.setEndRow(end);
		
		List<BoardVO> articles = boardServce.getArticles(vo);
		 model.addAttribute("articles", articles);
		 model.addAttribute("pvo", pvo);
		return "list";
	}
	
	@RequestMapping("content")
	public String content(HttpServletRequest request, HttpServletResponse response, BoardVO vo,
			Model model, PageVO pvo) {
		
		BoardVO article = boardServce.getArticle(vo);
		
		model.addAttribute("article", article);
		model.addAttribute("pvo", pvo);
		return "content";
	}
	
	@RequestMapping("writeForm")
	public String writeForm(HttpServletRequest request, HttpServletResponse response, BoardVO vo,
			Model model, PageVO pvo) {
		
		//답글이라면..
		model.addAttribute("article", vo);
		model.addAttribute("pvo", pvo);
		return "writeForm";
	}
	
	@RequestMapping("writePro")
	public String writePro(HttpServletRequest request, HttpServletResponse response, BoardVO vo,
			Model model, PageVO pvo) {
		vo.setIp(request.getRemoteAddr());
		boardServce.writeArticle(vo);
		model.addAttribute("pvo", pvo);
		return "redirect:list";
	}
	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, BoardVO vo,
			Model model, PageVO pvo) {
		BoardVO article = boardServce.getArticle(vo);
		model.addAttribute("article", article);
		model.addAttribute("pvo", pvo);
		return "updateForm";
	}
	@RequestMapping("updatePro")
	public String updatePro(HttpServletRequest request, HttpServletResponse response, BoardVO vo,
			Model model, PageVO pvo) {
		String msg = "";
		vo.setIp(request.getRemoteAddr()); //수정정한 위치를 저장
		int result = boardServce.updateAriticle(vo);
		
		if(result!=0) msg ="수정성공";
		else msg="수정실패";
		model.addAttribute("msg", msg);
		model.addAttribute("pvo", pvo);
		model.addAttribute("url", "list?curPage="+pvo.getCurPage());
		return "MsgPage";
	}
	@RequestMapping("deleteProc")
	public String deleteProc(HttpServletRequest request, HttpServletResponse response, BoardVO vo,
			Model model, PageVO pvo) {
		String msg = "";
		vo.setIp(request.getRemoteAddr()); //수정정한 위치를 저장
		int result = boardServce.deleteArticle(vo);
		
		if(result!=0) msg ="삭제성공";
		else msg="삭제실패";
		model.addAttribute("msg", msg);
		model.addAttribute("pvo", pvo);
		model.addAttribute("url", "list?curPage="+pvo.getCurPage());
		return "MsgPage";
	}
	
	
}
