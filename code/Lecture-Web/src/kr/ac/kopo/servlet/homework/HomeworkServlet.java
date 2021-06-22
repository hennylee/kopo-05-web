package kr.ac.kopo.servlet.homework;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeworkServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) 
			throws ServletException, IOException {
		
		requset.setCharacterEncoding("utf-8");
		
		
		
		String name = requset.getParameter("name");
		String id = requset.getParameter("id");
		String pwd = requset.getParameter("pwd");
		String sex = requset.getParameter("sex");
		String[] mails = requset.getParameterValues("mail");
		
		String job = requset.getParameter("job");
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<title>");
		sb.append("</title>");
		sb.append("</head>");
		sb.append("<body>");
		
		sb.append("<h2>개인 정보 출력</h2>");
		sb.append("<br>");
		sb.append("이름 : " + name + "<br>");
		sb.append("아이디 : " + id + "<br>");
		sb.append("암호 : " + pwd + "<br>");
		sb.append("성별 : " + sex + "<br>");
		
		
		String[] mailType = {"공지", "광고", "배송"};
		String[] mailCheck = {"받음", "받지 않음"};
		
		String notice = mailCheck[1];
		String ad = mailCheck[1];
		String delivery = mailCheck[1]; 
		
		for(String mail : mails) {
			
			switch (mail) {
			case "공지":
				notice = mailCheck[0];
				break;
			case "광고":
				ad = mailCheck[0];
				break;
			case "배송":
				delivery = mailCheck[0];
				break;
			}
				
		}
		
		sb.append("공지메일 : " + notice + "<br>");
		sb.append("광고메일 : " + ad + "<br>");
		sb.append("배송 확인 메일 : " + delivery + "<br>");
		sb.append("직업 : " + job);
		
		sb.append("</body>");
		sb.append("</html>");
		
		out.println(sb.toString());
		out.flush();
		out.close();
		
		
		
		
	}
}
