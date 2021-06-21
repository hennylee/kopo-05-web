## 서블릿 생성

- 일반 클래스로 만드는 서블릿 파일

- `HttpServelet` 추상 클래스를 상속받기만 하면 된다. 

- `init`, `sevice`, `destroy` 메소드를 만든다. 
  - `service` 메소드는 무조건 구현해야 한다.

- `throws ServletException, IOException`의 예외처리를 하는 이유는?

  - checkedException이므로 처리해줘야 한다. 
  - `ServletException` : 서블릿 예외 
  - `IOException` : 소켓 통신 스트림 예외


## 서블릿 폴더 경로

- 생성한 서블릿을 실행해보자 

- http://localhost:9999/Lecture-Web/servlet/kr.ac.kopo.servlet.HelloServlet 로 접속되는 것을 알 수 있다. 

- 근데 왜 404에러가 날까? (404에러 : 파일을 찾을 수 없는 에러 / 405에러 : 서블릿 에러)

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


- `url-pattern`은 `servlet-class`하나에 여러개가 매핑될 수 있다. 

- init, destroy 메소드는 추상메소드로 이미 구현되어 있기 때문에, 따로 조작할 필요가 없다면 굳이 구현하지 않아도 된다. 

- 다만 service 메소드는 구현되어 있지 않기 때문에, 서블릿에서 꼭 구현해줘야 한다. 

  - service 메소드가 없으면, 405 에러가 발생한다. 



## 2가지 요청메소드
- `get` 방식 : url의 uri 부분에 정보를 넘기는 방식

- `post` 방식 : url의 uri 부분에 정보를 숨기는 방식
  

- doPost 메소드에서는 post방식만 처리함

- doGet 메소드에서는 get방식만 처리함

- service메소드는 get/post 요청을 모두 처리할 수 있음


- 기본적으로 method를 명시해주지 않으면 `method="get"`이 실행된다. 

- `form`태그에서 `method="post"`을 통해 submit된 요청을 제외하고는 모두 get방식이라고 볼 수 있다.



## form태그로 doGet/ doPost 메소드 익혀보기

- 클라이언트가 서버에 요청
  - html에서 form태그 : `\Lecture-Web\WebContent\servlet\method.html`

  - 서블릿 서비스 처리 : `\Lecture-Web\src\kr\ac\kopo\servlet\MethodServlet.java`

  - form 태그의 목적은 어떤 정보를 전달하는 것이다. `input type="text"` 등의 방식으로 정보(쿼리 string)를 전달할 수 있다. 

  - 서블릿에서 html에서 넘겨진 정보는 `HttpServletRequest` 로 받는다.

  - 보안이 중요할 때에는 post방식으로 정보를 넘긴다. 


- get/post 차이

  - `get 방식` : get 방식의 파라미터가 uri를 통해서 실제 웹브라우저에서 서버로 날라갈때는, utf-8 방식으로 변환해서 날라간다. 
  - 크롬에서는 http://localhost:9999/Lecture-Web/method?id=홍길동 으로 보이지만, 실제로 서버에는 http://localhost:9999/Lecture-Web/method?id=%ED%99%8D%EA%B8%B8%EB%8F%99 의 uri가 전송된다.

  - `post 방식` : 반면, post 방식은 post가 아니라 body에 파라미터가 날라가기 때문에, 서버로 날라갈 때 utf-8 방식으로 변환되지 않는다.
  - 그래서 `requset.getParameter("name값")` 전에 `requset.setCharacterEncoding("utf-8")`으로 한 번 더 인코딩하는 과정이 필요하다. 


- 서버에서 클라이언트에 응답
  
  - `HttpServletResponse` 로 정보를 보낸다. 
  
  - OutputStream 이나 Writer 있어야 함
  
  - 한글을 전달하기 위해서 문자 스트림으로 넘기기 때문에 Writer가 필요하다. 

  - 응답 형식이나 문자 인코딩은 `setContentType()` 메소드를 활용한다. 


- GET방식 Network Header

![image](https://user-images.githubusercontent.com/77392444/122693235-f6494100-d273-11eb-90b8-eb71d6b0e528.png)

- POST방식 Network Header

![image](https://user-images.githubusercontent.com/77392444/122693264-209afe80-d274-11eb-9425-30dd81abc426.png)

