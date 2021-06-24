
## core - set 태그

- 형식 : `<c:set var="" value="" [scope=""] />`

- 공유 영역에 변수 설정 시 사용한다.

- 속성 설명
  - var : 설정할 변수명
  - value : 설정할 값
  - scope : 변수의 사용 영역( `page`, `request`, `session`, `application` )

- 공유영역 명칭 : 

|JSP 공유영역  |	EL 공유영역 		 |JSTL 공유영역|
|--------------|-------------------|-----------|
|pageContext		|pageScope			|page|
|request			|requestScope		|request|
|session			|sessionScope		|session	|
|application		|applicationScope	|application|


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


## core = forEach 태그

- 형식 (1) : 

```jsp
<c:forEach var = "i" begin="1" end="10">
  ${ i }
</c:forEach>
```

- begin : 반복문을 시작할 위치

- end : 반복문의 끝낼 위치

- step : 건너뛸 단계

- 형식 (2) : 


```jsp
String[] strArr = {"1", "2", "3"};
requset.setAttribute("strArr", strArr);

<c:forEach var = "s" items="${strArr}" [varStatus=""]>
  ${s}
</c:forEach>
```

- item : 반복시킬 배열이나 콜렉션 객체가 들어온다.
  - item 뒤에는 EL의 내장객체나 공유영역에 들어있는 객체를 가지고 와야 한다. 

- var :  반복문에서 사용할 변수가 들어온다. 

- varStauts : 변수명, 반복과 관련된 기본 정보를 담고 있는 객체
  - first : 반복문의 처음인지 판단해서, 참과 거짓을 반환한다. 
  - last : 반복문의 마지막인지 판단해서, 참과 거짓을 반환한다.
  - index : 반복문 시작시 0을 반환하고, 1씩 증가
  - count : 반복문 시작시 1을 반환하고, 1씩 증가
  - varStatus는 map처럼 움직이기 때문에, `varStatus="변수명"` 으로 설정해주면 `변수명.first`, `변수명.last`, `변수명.index`, `변수명.count` 로 쓴다.
