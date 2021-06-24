## 페이지 포함기술

- 실제로는 JSP 파일이 따로 구성되어 있지만, 하나의 JSP파일처럼 해석해서 웹브라우저에 출력해주는 기술을 페이지 포함기술이라고 한다. 

- 페이지를 포함하는 3가지 방식 : 

```
1. directive(지시자) - include
2. action(액션) - include
3. jstl - import
```

## 지시자 - include

- 다른 페이지의 코드를 내 페이지로 포함할 때 사용한다.

- 구문 : `<%@ include file = "파일경로" %>`

- 포함되는 시점 : 
  - jsp가 java(서블릿 코드)로 변환될 때 같이 포함된다.
  - `.class` 파일로 변환될때, 기준이 되는 jsp 파일만 서블릿코드로 변환된다. 
  - 이때, 기준이 되는 jsp에 include된 jsp내용은 기준 jsp의 service 메소드 안에 포함된다.

- 단점 : 
  - 공통 코드의 길이가 늘어날 시, 서블릿 코드의 줄수가 늘어나기 때문에 메모리 부하도 생기고, 웹브라우저가 해석할 수 있는 한도를 초과할 수 있다. 

  - 공통 코드가 수정된다면, 공통 코드를 가지고 있는 모든 서블릿 파일이 수정되어야 한다.


- 장점 : 
  - 다른 jsp와 변수를 공유할 수 있다.

- 활용예시 : 
  - JSP 페이지에서 사용되는 공통 변수 지정할 때, 사용한다.
  - 각 페이지에 고정적으로 사용되는 내용을 처리할 때 사용한다.(ex. 사이트 하단 부분)
  - 포함하고자 하는 내용이 적을 때, 사용한다.



## 액션 - include
- 다른 페이지의 실행 결과를 내 페이지로 포함시킨다.

- 파라미터와 공유영역(request) 이용하여 데이터를 공유

- 구문 : 
  - `prefix="jsp"` 인 액션태그이다. 
  
  - `액션 - include`는 page라는 속성에 포함시키고자 하는 파일경로를 적는다. 

```jsp
<%-- 파라미터 없는 경우 --%>
<jsp:include page= "파일경로" />

<%-- 파라미터 있는 경우 --%>
<jsp:include page =“파일경로”>
  <jsp:param name=“msg” value=“test” />
</jsp:include>
```


- 포함되는 시점 : 
  - 실행 시 (실행된 결과값이 포함)

  - 공통 include가 하나의 함수로 실행되어 있기 때문에 메소드의 호출방식을 쓴다. 

  - OutputStream 객체를 include된 jsp 파일에 매개변수로 넘겨준다. 

  - `.class`파일은 include된 jsp마다 생겨난다.

  - 내부적으로 서블릿에서 include된 부분을 호출하는 메소드는 아래와 같다. 

```j
out.write("	<h2>인클루드 전</h2>\r\n");
out.write("	");

// one.jsp에 out변수를 매개변수로 호출
org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "one.jsp", out, false);

// one.jsp에 parameter를 넘겨서 include할 때
org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response
  , "one.jsp" + "?" 
  + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("name", request.getCharacterEncoding())+ "=" 
  + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("hong gil-dong", request.getCharacterEncoding())
  , out, false);

out.write(' ');
out.write("\r\n");
out.write("	<h2>인클루드 후</h2>\r\n");
```


- 내부적으로 요청 형태로 include가 이루어지기 때문에, parameter를 넘길 수 있다. 

- 변수를 공유하는 방법 : 

  - request 공유 영역에 등록하기 : `request.setAttribute("id", "hong");`
  - parameter에 등록하기 : `<jsp:param name="name" value="hong gil-dong"/>`



- 요청 후 응답이 이루어질때까지, 기준이 되는 jsp와 include된 jsp가 연결되어 있기 때문에 request 공유영역을 공유할 수 있다. 

  - 응답이 끝나면 request 공유영역은 사라진다. 

 
 - 장점 : 메소드 호출도 부하가 있을 순 있지만, `지시자 - include`방식보다 효율적이다.

- 활용
  - JSP 페이지내의 중복적인 부분을 처리(예> 메뉴)


## 지시자와 액션 방식의 차이점

- 공통점  : 지시자와 액션 방식의 include는 내 서버에 있는 파일만 include가능하다.


|항목 |액션 |지시자|
|:------:|--------|-----------|
|처리시간 |실행 시 결과 처리 |JSP 파일을 자바 소스로 변환할때 처리|
|데이터 전달방법|공유영역 설정을 통한 방식|호출 페이지에 변수를 통한 공유
|||페이지 호출 시 파라미터 설정 |
|용도 |화면의 일부분을 모듈화| 페이지 공통 사용 변수|



## JSTL - import 

- 지시자와 액션 방식의 include는 내 서버에 있는 파일만 include가능했지만, 다른 서버의 실행 결과를 내 페이지로 포함시킬 수 있다. 

- JSTL core 태그의 일종이다. 

- 구문 : 

```jsp
<c:import url = "파일경로" />
<c:import url =“파일경로”>
<c:param name=“msg” value=“test” />
</c:import>
```

- 액션 include처럼, 실행 시 jstl 태그 라이브러리에 가서 url을 받아온다.

```java
out.write("	<h2>인클루드 전</h2>\r\n");
out.write("\r\n");
out.write("	");
if (_jspx_meth_c_005fimport_005f0(_jspx_page_context))
  return;
out.write("\r\n");
out.write("	<h2>인클루드 후</h2>\r\n");
```

