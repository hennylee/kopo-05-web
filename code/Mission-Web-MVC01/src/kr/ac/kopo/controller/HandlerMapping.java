package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * 클라이언트가 요청한 uri를 넘겨주면, 매핑되는 controller를 찾아준다.
 * @author iamsu
 *
 */
public class HandlerMapping {
	
	// 멤버변수
	private Map<String, Controller> mappings;
	
	// 생성자
	public HandlerMapping() {
		this("C:\\kopo\\kopo-05-web\\code\\Mission-Web-MVC01\\bean.properties");
	}
	
	public HandlerMapping(String propLoc) {
		
		// <properties파일에서 불러오는 방법> 
		mappings = new HashMap<String, Controller>();
		Properties prop = new Properties();
		
		try {
			//InputStream is = new FileInputStream("C://kopo//kopo-05-web//code//Mission-Web-MVC01//bean.properties");
			InputStream is = new FileInputStream(propLoc);
			prop.load(is); // properties파일의 내용을 불러오는 메소드
			
			Set<Object> keys = prop.keySet();
			
			// properties의 key값을 뽑아내기
			for(Object key : keys) {
				// getProperty 메소드에 key값을 매개변수로 넣으면 value값이 return 됨
				String className = prop.getProperty(key.toString()); 
				
				Class<?> clz = Class.forName(className);
				
				// controller인스턴스를 맵핑해주기
				mappings.put(key.toString(), (Controller)clz.newInstance());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 //<properties 파일을 사용하지 않고 map을 사용하는 방법>
		/* 
		mappings = new HashMap<String, Controller>();
		mappings.put("/board/list.do", new BoardListController());
		mappings.put("/board/writeForm.do", new WriteFormController());
		mappings.put("/board/detail.do", new BoardDetailController());
		*/
		 
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
	
	/*
	public static void main(String[] args) {
		
		try {
			
			// 클래스 이름을 알아내서 인스턴스를 반환하기
			Class<?> clz = Class.forName("kr.ac.kopo.controller.BoardListController");
			BoardListController list = (BoardListController)clz.newInstance();
			System.out.println(list);
			System.out.println(list.handleRequest(null, null));
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	*/
	
}
