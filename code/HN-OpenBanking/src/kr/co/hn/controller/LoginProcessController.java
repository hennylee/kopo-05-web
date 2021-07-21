package kr.co.hn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hn.dao.LoginDAO;
import kr.co.hn.vo.MemberVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String type = request.getParameter("user-type");
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPassword(pw);
		member.setType(type);
		
		LoginDAO dao = new LoginDAO();
		MemberVO user =  dao.login(member);
		
		String url = "";
		String msg = "";
		
		// 로그인 실패
		if(user == null) {
			msg = "로그인에 실패하였습니다";
			url = "/login.do";
		}
		// 로그인 성공
		else {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("id", user.getId());
			url = "redirect:/";
		}
		
		System.out.println(msg);
		request.setAttribute("msg", msg);
		
		
		return url;
	}

}
