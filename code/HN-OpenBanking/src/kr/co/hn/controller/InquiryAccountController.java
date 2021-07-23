package kr.co.hn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hn.dao.AccountDAO;
import kr.co.hn.vo.AccountVO;

public class InquiryAccountController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String msg = "";

		/*
typeCode : typeCode,
accountNum : accountNum,
amount : amount,
myBalance : balance
myAccount : account	
		 */
		
		String typeCode = request.getParameter("typeCode"); 
		String accountNum = request.getParameter("accountNum");
		String amount = request.getParameter("amount");
		
		// 1. 상대 계좌 주인 존재하는지 확인하기
		AccountVO vo = new AccountVO();
		
		vo.setAccount(accountNum);
		vo.setTypeCode(typeCode);
		
		AccountDAO dao = new AccountDAO();
		String holder = "이해니";
//		String holder = dao.inquiryHolder(vo);
		
		if(holder == null) {
			msg = "계좌번호 입력 오류입니다.";
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("holder", holder);
			
		return "/transfer/transfer3.jsp";
	}


}
