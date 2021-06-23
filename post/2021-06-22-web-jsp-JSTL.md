
## JSTL이란?

- JSTL은 JSP의 기본 문법이 아니다.

- JSP도 사용자가 원하는대로 기능을 하는 Custom Tag를 만들 수도 있다.

- JSP 안에 표현식으로 자바 코드 쓰는 것이 복잡하기 때문에 만들어졌기 때문에, 표현식을 대체할 수 있도록 Custom Tag를 만들 수 있게 한 것이다. 

- 반복, 조건 등의 Custom Tag는 개발자마다 코드가 비슷하기 때문에, 많이 사용되는 Custom Tag를 모아서 하나의 표준 태그로 만든 것이 JSTL 라이브러리이다.

- 그래서 JSTL은 JSP의 기본문법이 아니기 때문에 JQuery처럼 JSTL 라이브러리를 다운받아서 사용해야한다.



## JSTL 종류 및 사용법

- JSTL 종류
  - `core` : 모든 사이트 주요 사용 태그
  - `fmt` , `함수` : 빈도는 낮지만 가끔 사용
  - `sql`, `xml` : 거의 사용하지 않음

- JSTL은 JSP의 기본문법이 아니기 때문에 JQuery처럼 JSTL 라이브러리를 다운받아서 사용해야한다.

- 라이브러리 다운받는 곳 : http://tomcat.apache.org/taglibs/standard/

- JSTL 종류별 URI

|라이브러리 |접두어 |관련URI|
|:-----------:|:-----:|:------|
|코어 |c |http://java.sun.com/jsp/jstl/core|
|XML |x |http://java.sun.com/jsp/jstl/xml|
|국제화 |fmt |http://java.sun.com/jsp/jstl/fmt|
|데이터베이스 |sql |http://java.sun.com/jsp/jstl/sql|
|함수 |fn |http://java.sun.com/jsp/jstl/functions|


- taglib 지시자로 선언하기

  - taglib 지시자를 사용해서 JSP에 JSTL 관련 정보를 알려야 한다.

  - 시작태그와 종료태그(`/`)가 반드시 있어야 한다.

```jsp
<%@ taglib prefix=“c” uri=“http://java.sun.com/jsp/jstl/core” %>
<c:out value=“test” />
```

|JSP 공유영역  |	EL 공유영역 		 |JSTL 공유영역|
|--------------|-------------------|-----------|
|pageContext		|pageScope			|page|
|request			|requestScope		|request|
|session			|sessionScope		|session	|
|application		|applicationScope	|application|


## core - set 태그

- 형식 : `<c:set var="" value="" [scope=""] />`

- 공유 영역에 변수 설정 시 사용한다.

- 속성 설명
  - var : 설정할 변수명
  - value : 설정할 값
  - scope : 변수의 사용 영역( `page`, `request`, `session`, `application` )

- 디폴트 설정 영역 : page

- scope를 설정해주지 않으면 page 공유영역으로 설정된다.

- 사용 예 : `<c:set var =“cnt” value=“1” scope = “page” />`


## core - remove 태그

- 공유 영역에 변수 삭제 시 사용한다.

- 형식 : `<c:remove var="" value="" [scope=""] />`

  - var : 삭제할 변수명
  - scope : 삭제할 변수가 설정되어 있는 영역

- scope를 설정하지 않으면 4가지 공유영역을 다 뒤지면서 같은 이름의 변수를 모두 삭제한다.


## core - out 태그

- 형식 : 
`<c:out value=“” [escapeXml=“true/false”] [default=“”] />`

- 출력 전용 태그

- 속성 설명 : 
  - value : 출력할 내용을 지정
  - escapeXml : true 일 경우 : 출력내용에 태그가 있을 경우 문자값으로 변경처리
    - escapeXml을 false로 지정할 경우, value에 있는 마크업 언어를 웹브라우저에서 해석해버린다. 
    - escapeXml는 디폴트 값이 true이기 때문에, 마크업 언어를 문자열로 인식해서 웹브라우저에서 해석하지 않는다.

  - default :
    - value 속성의 값이 없을 경우 디폴트로 출력할 내용 지정
    - default 속성에 값을 지정해둘 경우, value 속성의 값이 없을 경우 디폴트 속성에 지정해둔 값이 출력된다.

- EL태그만 쓰면 되는데 왜 굳이 out 태그 + EL 태그를 쓸까?
  - 악성 코드를 숨겨놓은 것을 방지할 수 있다?


## core - if 태그
- 형식 :

```jsp
<c:if test=“조건”>
  조건이 참일 경우 실행할 내용
</c:if>
```

- 조건에 따라 내용을 실행한다. 

- else를 사용할 수 없다. 만약 5개의 if가 있으면 5개의 if를 모두 거치게 된다.

  - 이러한 비효율적 성능 문제를 해결하기 위해, choose 태그가 생겼다. 

- 속성 :
  - test : 참과 거짓을 판단하는 조건을 명시

- 사용 예 : 

```jsp
<c:if test=“${5 == 5}”>
  5 == 5 와 같습니다.
</c:if>
```

## core - choose 태그

- 다중 조건 처리 태그이다.

- 형식

```jsp
<c:choose>
  <c:when test=“”>
    조건이 참일 경우 실행할 내용
  </c:when>
   ……
  <c:otherwise>
    when 절이 모두 거짓일 경우 실행할 내용
  </c:otherwise>
</c:choose>
```

- if 태그의 else, else if 를 사용하지 못하는 문제를 해결하기 위해 생겨났다. 

-  `when` = else if / `otherwise` = else 와 비슷하다. 

- 속성 :
  - test : 참과 거짓을 판단하는 조건을 명시
