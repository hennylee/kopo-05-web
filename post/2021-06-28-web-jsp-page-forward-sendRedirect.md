## 페이지 이동 : forward

- 다른 페이지로 응답을 떠넘겨 시키는 것이 `forward`이다.

- 구문 : 

```jsp
<jsp:forward path = "파일경로" />
```

- 요청을 받은 JSP와 응답을 하는 JSP가 다른 것이다. 

- 외부에서는 요청을 받은 jsp가 응답을 하는 것처럼 보이지만, 실상은 다른 jsp가 응답을 하고 있는 형태이다. 

- 그래서 url은 응답을 하고 있는 jsp의 url로 변하지 않고 요청을 한 jsp의 url을 유지하게 된다. 

- 두 jsp는 request 영역을 공유한다. 

- 내부적으로는 액션 include 처럼 메소드 호출 형태를 취하기 때문에 name, value 형태의 param을 이용하여 request이외의 데이터를 공유할 수 있다. 

```jsp
<jsp:forward path=“파일경로”>
  <jsp:param name=“msg” value=“test” />
</jsp:forward>
```

- 조건에 따라 다른 페이지를 보여주고 싶을 때, forward 기술을 활용한다. 

- 지시자, 액션, jstl의 세가지 방법이 존재했던 include 기술과 달리, 액션 forward 1개만 존재한다. 

- 장점 : 중요한 소스 코드를 숨길 수 있다. 


## sendRedirect

- 지시자, 액션태그, jstl과 같은 jsp의 문법이 아니라, 서블릿의 문법이다. 

- 서블릿 문법이기 때문에, 스크립트릿(`<% %>`) 안에 작성해야 한다. 

- a.jsp 요청하면 서버가 클라이언트에게 강제로 b.jsp로 요청하라고 시키는 것이다. 

- 즉, 요청을 재발생시키는 것이다. 

- 이때, forward와 달리 요청이 2번 발생하는 것이기 때문에 request 영역, param 등의 데이터를 공유할 수 없다. 

- 데이터를 공유하려면, uri에 서블릿의 `request.getParameter("")`를 사용해서 넘긴다.

```jsp
<%
  response.sendRedirect("user.jsp?id=" + request.getParameter("id"));
%>
```

- 서버가 클라이언트에게 응답을 주는 것이기 때문에, 요청 객체가 `response.` 이다.

- url이 b.jsp로 변경되기 때문에, 실제 클라이언트도 내부적으로 b.jsp가 응답하고 있다는 것을 알 수 있다. 
