package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet {
	
	// doGet : get방식만 처리
	/* 부모의 접근제한자보다 자식의 접근제한자는 크거나 같을 수 있다. */
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

	@Override
	/* 부모의 접근제한자보다 자식의 접근제한자는 크거나 같을 수 있다. */
	protected void doPost(HttpServletRequest requset, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// request의 body 부분을 인코딩
		requset.setCharacterEncoding("utf-8");
		
		String method = requset.getMethod();
		String uri = requset.getRequestURI();
		String id = requset.getParameter("id");
		
//		System.out.println(method);
//		System.out.println(uri);
//		System.out.println(id);
		
		
		// response 인코딩
		response.setContentType("text/html; charset=utf-8");
		
		// response 객체를 통해서 IO를 받아오기
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>메소드 호출방식 - POST</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("==============================================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출 력 결 과 <br>");
		out.println("==============================================================<br>");
		out.println("요청 URI : " + uri + "<br>");
		out.println("요청 메소드 : " + method + "<br>");
		out.println("파라미터(id) : " + id + "<br>");
		out.println("==============================================================<br>");
		out.println("</body>");
		out.println("</html>");
		
		out.flush();
		out.close();
	}
	
	
	
	
}
