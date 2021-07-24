package kr.co.hn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.hn.dao.AccountDAO;
import kr.co.hn.vo.AccountTypeVO;
import kr.co.hn.vo.AccountVO;
import kr.co.hn.vo.BankCodeVO;

public class Transfer3Controller implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * acnt : account,
			account_pw : accountPw,
		 */
		String msg = "";
		String url = "";
		AccountVO vo = new AccountVO();
		String account = request.getParameter("acnt");
		String password = request.getParameter("account_pw");
		vo.setAccount(account);
		vo.setPassword(Integer.parseInt(password));
		
		AccountDAO dao = new AccountDAO();
		int result = dao.checkPassword(vo);
		
		// 비밀번호 일치
		if(result > 0) {
			// 계좌 이체 성공
			//dao.transaction();
			
			// 계좌 이체 실패
			
		}
		// 비밀번호 불일치
		else {
			msg = "비밀번호가 일치하지 않습니다. ";
		}
		
		request.setAttribute("msg", msg);
		
		return "/transfer/result.jsp";
	}

}
