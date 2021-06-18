package kr.ac.kopo.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// javax : 자바엔터프라이즈 버전(Java EE)

public class HelloServlet extends HttpServlet{
	
	@Override
	public void init(ServletConfig config) throws ServletException{
		System.out.println("init() : 최초 한 번만 실행되는 메소드");
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		System.out.println("service() : 실제 작업이 이루어지는 메소드");
		System.out.println("사용자가 요청할때마다 호출되는 메소드입니다. ");
	}
}
