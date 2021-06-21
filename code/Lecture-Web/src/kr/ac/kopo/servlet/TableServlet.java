package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http:///localhost:9999/Lecture-Web/servlet/table?row=4&col=3 요청 시 해당 행/열의 테이블 생성
@WebServlet("/servlet/tableExam")
public class TableServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int row = 5;
		int col = 5;
		
		String strRow = request.getParameter("row");
		String strCol = request.getParameter("col");
		
		
		if(strRow != null)
			row = Integer.parseInt(strRow);
		
		col = strCol == null ? 5 : Integer.parseInt(strCol);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("	<title>테이블 출력</title>");
		sb.append("<style>");
		sb.append("	td {");
		sb.append("		padding: 0 10px;");
		sb.append("	}");
		sb.append("</style>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("==============================================================<br>");
		sb.append("&nbsp;&nbsp;&nbsp;&nbsp;출 력 결 과 <br>");
		sb.append("==============================================================<br>");
		sb.append("	<table border='1'>");
		
		for(int i = 0; i < row; i++) {
			sb.append("		<tr>");
			for(int j = 0; j < col; j++) {
				sb.append("			<td>cell("+ i +","+j+")</td>");
			}
			sb.append("		</tr>");
		}
		
		sb.append("	</table>");
		sb.append("==============================================================<br>");
		sb.append("</body>");
		sb.append("</html>");
		
		out.println(sb.toString());
		out.flush();
		out.close();
		
	}
	
	

}
