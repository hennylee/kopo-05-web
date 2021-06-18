## 서블릿 생성

- 일반 클래스로 만드는 서블릿 파일


- HttpServelet 추상 클래스를 상속받는다. 

- init, sevice, destroy 메소드를 만든다. 

- `throws ServletException, IOException`의 예외처리를 하는 이유는?

  - checkedException이므로 처리해줘야 한다. 
  - `ServletException` : 서블릿 예외 
  - `IOException` : 소켓 통신 스트림 예외



## 서블릿 폴더 경로

- 생성한 서블릿을 실행해보자 

- http://localhost:9999/Lecture-Web/servlet/kr.ac.kopo.servlet.HelloServlet 로 접속되는 것을 알 수 있다. 

- 근데 왜 404에러가 날까?

- 서블릿 파일이 만들어져 있는 `WEB-INF`는 보안 폴더이기 때문에 외부에서 url로 직접적으로 접근할 수 없는 파일이기 때문이다. 

![image](https://user-images.githubusercontent.com/77392444/122512159-69b83c00-d043-11eb-8c26-e3ec603a5320.png)

- 그래서 해당 서블릿에 해당하는 `.class` 파일에 접근하기 위해서는 서블릿의 `가상의 url`이 반드시 필요하다. 

- 이때, 서블릿과 가상의 url을 매핑시키는 규칙을 환경설정해두는 행위를 `web.xml`에서 한다. 

  - 3.1버전에서는 순수 자바 문법으로 환경설정을 하기 때문에 web.xml을 만들지 않는다. 


## web.xml 서블릿 등록

- `servlet` 태그와 `servlet-mapping` 태그가 하나의 쌍으로 움직인다. 

- `servlet-name`이 같으면 매핑된다. 

- `servlet-class` 태그에는 `.java`라는 확장자를 붙이지 않는다. 

- `url-pattern`태그 값이 바로 `가상의 url`이 되는 것이다. 
  - root가 어디일까? 
  
  ![image](https://user-images.githubusercontent.com/77392444/122511811-cf57f880-d042-11eb-905a-9dd547580c9f.png)


- web.xml 설정 후, 다시 서블릿을 실행해보자.
  - url은 ? http://localhost:9999/Lecture-Web/hello 로 변경되었다.

- 해당 url에서 새로고침을 해보자
  - init 메소드는 한 번만 실행되고, service() 메소드만 새로고침할때마다 호출되는 것을 볼 수 있다. 
  
  ![image](https://user-images.githubusercontent.com/77392444/122511981-1fcf5600-d043-11eb-8a1d-529595332fb9.png)

