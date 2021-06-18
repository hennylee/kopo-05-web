package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet {
	
	// get방식의 http://localhost:9999/Lecture-Web/method?id=ㅋㅋㅋ
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		// client의 요청 분석
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		String method = request.getMethod();
		String id = request.getParameter("id"); // id라는 name을 가지고 있는 value를 알아내기
		
		System.out.println("doGet() 호출");
		System.out.println("url : " + url.toString());
		System.out.println("uri : " + uri);
		System.out.println("method : " + method);
		System.out.println("id : " + id);
		
		// client에게 응답
		response.setContentType("text/html; charset=utf-8"); // 응답형식 설정
		PrintWriter out = response.getWriter(); // output 장치 얻어오기
		out.println("<html>");
		out.println("	<head>");
		out.println("		<title> 메소드 호출 방식</title>");
		out.println("	</head>");
		out.println("	<body>");
		out.println("==============================================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;요 청 결 과 <br>");
		out.println("==============================================================<br>");
		out.println("파라미터(id) : " + id + "<br>");
		out.println("요청방식 : " + method + "<br>");
		out.println("요청 uri : " + uri + "<br>");
		out.println("요청 url : " + url + "<br>");
		out.println("==============================================================<br>");
		out.println("	</body>");
		out.println("</html>");
		
		out.flush();
		out.close(); // 접속 해제
	}
}
