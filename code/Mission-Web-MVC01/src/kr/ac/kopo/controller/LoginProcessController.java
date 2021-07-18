package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.login.LoginDAO;
import kr.ac.kopo.login.MemberVO;

public class LoginProcessController implements Controller {

	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPassword(password);
		
		LoginDAO dao = new LoginDAO();
		MemberVO userVO = dao.login(memberVO);
		
		String url = "";
		
		if(userVO == null) {
			// 로그인 실패
			url = "redirect:/login.do";
		}
		else {
			// 로그인 성공
			url = "redirect:/";
			
			// 세션 등록 : jsp가 아니기 떄문에 세션객체는 HttpServletRequest 객체를 통해서 받아와야 함
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
		
		return url;
	}
	/*
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPassword(password);
		
		LoginDAO dao = new LoginDAO();
		MemberVO userVO = dao.login(memberVO);
		
		String msg = "";
		String url = "";
		
		if(userVO == null) {
			// 로그인 실패
			msg = "아이디 또는 패스워드를 잘못 입력하셨습니다.";
			url = request.getContextPath() + "/login.do";
		}
		else {
			// 로그인 성공
			msg = "로그인을 성공하였습니다.";
			url = request.getContextPath();
			
			// 세션 등록 : jsp가 아니기 떄문에 세션객체는 HttpServletRequest 객체를 통해서 받아와야 함
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		
		return "/login/loginProcess.jsp";
	}
	*/

}
