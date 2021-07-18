package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 세션 삭제
		HttpSession session = request.getSession();
		session.invalidate();
		//session.removeAttribute("userVO");
		
		/* 
		<forward> : forward를 시킬때는 주소를 반환하면 된다. 
			return "/login/logout.jsp";
		*/
		
		
		// <redirect>
		return "redirect:/"; // '/' 는 'index.jsp'이다.
	}

}
