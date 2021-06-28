# 상태정보 유지기술 : 쿠키, 세션

- 장바구니 : 한달동안만 (스케줄링 - DB)
- 팝업창 오늘 하루만 안보기

- 여러번의 요청이 일어나도 자신의 어떤 상태 및 값을 유지하고 싶은 기술



## 세션 : Session

- 정보저장 위치가 `서버`이다.

- 장점 : 쿠키에 비해 보안상 문제 발생 소지가 적다. 

- 단점 : 서버의 부하가 커진다. 

- 서버 입장에서는 정보를 계속 저장시키는 것이 부담이 크다. 사용자가 늘어날수록 저장해야 할 정보가 많기 때문이다. 

- 그래서 세션은 웹브라우저가 종료되면 서버에 저장된 세션을 삭제한다. 최대 유효기간이 웹브라우저가 닫힐 때까지인 것이다. 

- 정보 저장 시, 세션은 객체 타입의 정보를 저장할 수 있다. 

- 세션은 하나의 클라이언트가 웹브라우저를 닫기 전까지 유지되는 정보이다. 

- 세션은 여러번의 요청-응답이 이루어져도 웹브라우저를 종료하기 전까진 지속된다. 

- 요즘은 개인정보보호 문제로 인해서 기본 session의 유효시간이 30분으로 설정되어 있다.

- 또 web.xml이나 session API를 활용해서 직접 session의 유효시간을 설정할 수 있다. 

```XML
<session-config>
  <sesison-timeout>
    30
  </sesison-timeout>
</session-config>
```

```java
session.setMaxInactiveInterval(int interval);
```

- jsp에서의 session 

  - sesion은 page, request, application과 같은 공유영역으로 세션은 설정하고 세션 값을 가져올때, `getAttribute` 와 `setAttribute` 메소드를 사용한다.

  - page지시자 : `<%@ page session="true"%>` : 세션이 없으면 새로운 세션은 만들도록 하는 것(디폴트가 true이기 때문에 일반적으로 선언할 필요가 없다.)




## 세션 API

- jsp에서는 session은 내장객체이기 때문에 객체를 생성할 필요가 없지만, 
직접 자바언어로 서블릿 코드를 짤때는 `request.getSession` 등을 통해 session 객체를 직접 얻어와야 한다. 

- 세션 객체 얻기

```java

```

- 세션에 설정된 값 추출

```java

```

- 세션 삭제

  - 세션 개별 삭제 : `session.removeAttribute("id");`
  - 세션 일괄 삭제 : `session.invalidate();` 


- 마지막 접속 시간 알아내기

  - `session.getMaxInactiveInterval();`


## JSESSIONID

- 웹브라우저에서 세션이 어떤 클라이언트의 세션인지 빨리 구분해내기 위해서 내부적으로 쿠키 형태로 세션 정보를 가지고 있는 것이 JSESSIONID이다. 

- 각 클라이언트 컴퓨터와 서버의 세션 정보를 매핑시키는 것이다. 

- 근데 어떤 컴퓨터들은 보안 강화를 위해 쿠키에 어떤 정보도 저장하지 못하게 한다. 

- 이때는 JSESSIONID가 parameter로 넘어가서 그 역할을 대체하는 경우가 있다. 

![image](https://user-images.githubusercontent.com/77392444/123588389-a2fe6200-d822-11eb-98da-eb3e2a5acad6.png)
