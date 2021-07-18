package kr.ac.kopo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.HandlerMapping;

public class FrontControllerServelet extends HttpServlet {

	private HandlerMapping mappings;
	
	@Override
	//ServletConfig에 날라가는 정보는 web.xml에서 init-param에 등록된 정보이다.
	public void init(ServletConfig config) throws ServletException {
		
		String propLoc = config.getInitParameter("propertyLocation");
		
		
		if(propLoc != null)
			mappings = new HandlerMapping(propLoc);
		else
			mappings = new HandlerMapping();
			
	}
	
	// service메소드는 한 번 클라이언트한테 요청이 들어올때마다 처리하는 함수이다. 
	// 1초에 1만명이 들어오면, 1만번 service작업을 해야한다. 
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String uri = request.getRequestURI();

		// 매번 프로젝트명이 /Mission-Web-MVC01이라는 보장이 없을 것임 => requeset.getContextPath()로 알아낼 수 있음
		String context = request.getContextPath();
		
		// 요청 uri만 알아내려면?
		uri = uri.substring(context.length());
		
		
		try {
			
			/*
				1초에 1만명씩 접속하면, HandlerMapping이 1만번 만들어지면서 map 객체가 1만번씩 만들어진다. 
				이렇게 되면 부하가 심할 것이다. 
				
				이때, 한번 서블릿이 호출되면 맨 처음에 딱 한 번만 호출되는 메소드가 바로 init이다. 
				service는 만들어진 객체를 접근하면서 원하는 map객체를 가져오기만 하면 된다. 
				
				그래서 init 메소드로 분리시키는 것이 부하를 줄이는 방법이다. 
				
				HandlerMapping mappings = new HandlerMapping();
			 */
			Controller control = mappings.getController(uri);
			
			/*
			HandlerMapping 클래스로 제작하여 대체
			
			switch(uri) {
			
			case "/board/list.do" :
				control = new BoardListController();// 묵시적 형변환
				break;
				
			case "/board/writeForm.do" :
				control = new WriteFormController();
				break;
				
			}
			*/
			String callPage = control.handleRequest(request, response);
			
			if(callPage.startsWith("redirect:")) {
			
				// callPage = "redirect:/"
				callPage = callPage.substring("redirect:".length());
				response.sendRedirect(request.getContextPath() + callPage);

			} else {
				
				// 서블릿에서 forward시키는 기술은? RequestDispatcher라는 객체이다. 
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);
			
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
	
}
