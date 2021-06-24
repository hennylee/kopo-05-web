
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

  - 지시자는 항상 페이지의 맨 위에 올 필요는 없지만, 보통 맨 뒤에 사용한다. 

- 사용예 : 

```jsp
<%@ taglib prefix=“c” uri=“http://java.sun.com/jsp/jstl/core” %>
<c:out value=“test” />
```

- 공유영역 명칭 : 

|JSP 공유영역  |	EL 공유영역 		 |JSTL 공유영역|
|--------------|-------------------|-----------|
|pageContext		|pageScope			|page|
|request			|requestScope		|request|
|session			|sessionScope		|session	|
|application		|applicationScope	|application|

