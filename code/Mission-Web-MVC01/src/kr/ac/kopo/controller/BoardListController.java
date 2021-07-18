package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.BoardDAO;
import kr.ac.kopo.board.BoardVO;

public class BoardListController implements Controller{
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectAll();
		
		// 공유 영역에 등록
		request.setAttribute("list", list);
		// foward 시킬 주소니까 root는 http://localhost:9999/WEB-MVC01 밑임
		return "/board/list.jsp";
	}
}
