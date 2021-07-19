package kr.co.hn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hn.dao.QNABoardDAO;
import kr.co.hn.vo.QNABoradVO;

public class QNAInsertController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String writer = session.getId();
		System.out.println(writer);
		
		QNABoradVO vo = new QNABoradVO();
		vo.setWriter("haeni");
		vo.setSubject("#2 : 테스트");
		vo.setContent("내용무");
		
		QNABoardDAO dao = new QNABoardDAO();
		int result = dao.insertQ(vo);
		
		System.out.println(result);
		
		
		return "redirect:/qna/list.do";
	}

}
