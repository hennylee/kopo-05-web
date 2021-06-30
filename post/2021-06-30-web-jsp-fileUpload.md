
## input태그로 사진 파일 입력받기


### 1. 사용자 입력 받기

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 테스트</h2>
	
	<%-- 1. 사용자 입력 받기 --%>
	<form action="uploadInfo.jsp" method="post">
		id : <input type="text" name="id"><br>
		파일 : <input type="file" name="uploadfile"><br>
		<input type="submit" value="전송">
	</form>
	
</body>
</html>
```

![image](https://user-images.githubusercontent.com/77392444/123907262-9a3b9680-d9b0-11eb-8783-4d79a40ce5cc.png)


### 2. I/O로 전송 받기

```jsp
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>전송된 정보 출력</h2>

<%
	InputStreamReader isr = 
			new InputStreamReader(request.getInputStream(), "utf-8");

	BufferedReader br = new BufferedReader(isr);
	
	while(true){
		String data = br.readLine();
		if(data == null) break;
		out.println(data + "<br>");
	}
	
%>
</body>
</html>
```

- 클라이언트가 나에서 정보를 전달하면, 서버는 클라이언트가 넘겨준 데이터를 받아야 한다. 

- 이때, 클라이언트가 폼태그로 전송한 내용으로 읽어오려면 `request객체`에서 받아오면 된다.

- request객체에 읽어오기 위해서 서버 입장에서 필요한 수단은? 

- 내부적으로 I/O 형태로 넘어오기 때문에 `InputStream`이나 `Reader`로 `request`를 읽어야 한다. 

- 하지만, 모든 클라이언트가 자바 언어로 만들어졌다는 보장이 없다. 

- 만약 자바언어로 작성된 클라이언트라면 문자 스트림으로 request 값을 받아올 수 있지만, C언어로 작성된 클라이언트라면 내부적으로 I/O가 바이트 스트림으로 넘어온다.

- 그래서 서버에서 I/O 데이터를 받아오려면, 이기종 간의 통신을 위해서 바이트 스트림으로 값을 받아와야 한다. 

- 전송받은 결과물을 조회하면 아래와 같다.

![image](https://user-images.githubusercontent.com/77392444/123907164-6e201580-d9b0-11eb-80a5-a9ae75b471d3.png)

- 이때 사진 파일을 전송했지만, 전송 받은 결과는 파일명 뿐이다.

- 계속해서 파일 객체를 받아오는 방법을 알아보자.



### 3. 사진 파일로 객체 받아오기

- 앞에서 file을 전송했지만 `name=value` 형태로 request값이 날라온 이유는 무엇일까? 

- 그 이유는 바로 `<form>` 태그에 있다.

- 폼태그에 enctype 속성을 별도로 지정해주지 않으면, 디폴트로 enctype 속성이 `enctype="application/x-www-form-urlencoded"`로 되어있기 때문이다. 

- 폼태그의 `endtype`속성이란 무엇일까? 

- `<form>` 태그의 enctype 속성은 폼 데이터(form data)가 서버로 제출될 때 해당 데이터가 인코딩되는 방법을 명시하는 것이다.

 - 이 속성은 <form> 요소의 method 속성값이 `post`인 경우에만 사용할 수 있다.

- 이때, 폼 데이터를 파일 형태로 받아오려면 enctype을 `enctype="multipart/form-data"`로 설정해줘야 한다.
  
```html
<%-- 1. 사용자 입력 받기 --%>
<form action="uploadInfo.jsp" method="post" enctype="multipart/form-data">
  id : <input type="text" name="id"><br>
  파일 : <input type="file" name="uploadfile"><br>
  <input type="submit" value="전송">
</form>
 ```
  
- 이렇게 데이터를 전송해주면, 아래와 같이 multipart 형태로 값을 받아올 수 있게 된다.

![image](https://user-images.githubusercontent.com/77392444/123891104-60a86280-d993-11eb-8466-9e77d6e6142b.png)



### 4. cos.jar 라이브러리

- `multipart/form-data`로 값을 받아올때마다 파일명, 파일 속성, 파일 유형, 실제 파일 바이트 값을 추출하는 것이 번거롭기 때문에 
이 과정을 쉽게 만들어주는 `cos.jar`라는 라이브러리가 존재한다. 

- 다운로드 : http://www.servlets.com/cos/

- 압축 풀고, `lib`폴더에 `cos.jar` 파일을 저장해서 활용하면 된다.

- cos.jar에는 `multipartRequest`라는 객체가 있다. 

- `multipartRequest`라는 객체가 바로 파일명, 파일 속성, 파일 유형, 실제 파일 바이트 값을 쉽게 추출할 수 있도록 만들어준 객체이다. 

- 그래서 `multipart/form-data` 로 request를 받아올때는 `request`객체가 아니라 `multipartRequest`라는 객체로 값을 받아와야 한다.

![image](https://user-images.githubusercontent.com/77392444/123891770-5d61a680-d994-11eb-86b9-162b137a4704.png)

- `multipartRequest` 클래스 생성자
  - `saveDirectory` : 데이터를 저장하는 위치
  - `maxPostSize` : 파일을 올릴때 최대 크기
  - `FileRenamePolicy` : 파일을 올리면 saveDirectory에 저장이 되는데, 한 사용자 뿐만 아니라 다양한 사용자가 업로드하게 된다. 그래서 중복된 이름의 파일이
  업로드될 수 있다. 이때 서버 내에 중복 이름 파일을 겹치지 않게 변환하는 파일명 규칙을 작성해둔 것이 FilerRenamePolicy가 된다.

![image](https://user-images.githubusercontent.com/77392444/123901391-cdc4f380-d9a5-11eb-9291-7c79ff7944fd.png)

- multipartRequest DOCS : http://www.servlets.com/cos/javadoc/com/oreilly/servlet/MultipartRequest.html


## 게시판에 사진 파일 업로드하기

### 1. 사용자 입력 받기

### 2. form태그 enctype 변경

### 3. 파일 확장자 체크

### 4. FileRenamePolicy 클래스 제작

- Java 5 부터 UUID 클래스를 사용해서 유일한 식별자를 생성할 수 있습니다. 

- 숫자 일련번호를 사용한 식별자도 각각의 데이터를 구분하는데 충분하지만, 다른 데이터를 유추하기 쉽다는 단점이 있습니다.


### 5. 파일 업로드 폴더 만들기

- 개발용 임시저장 폴더 : [WebContent/upload]
  
- 현재, 이클립스에 아파치톰캣을 넣어놨기 때문에 WebContent 폴더에 파일을 저장하면 자동으로 `server-path` 폴더에 있는 wtpwebapps파일로 옮겨진다. 

- 하지만 실제 배포 후에는, 아파치(웹서버)와 톰캣(was)는 별개이기 때문에 `[server-path/wtpwebapps]` 폴더에 있는 파일을 저장해야 한다. 
  
- 컴퓨터 입장에서 파일을 불러올때도 파일 경로는 서버에 있는 폴더여야 한다. 

  
  
  
### 6. MultipartRequest 객체로 request 받아서 vo객체로 저장하기
  
  
  
#### 게시글의 일반 데이터와 multipart 데이터의 VO 객체는 따로 만들어줘야 할까?
  
- 만약 둘의 데이터가 서로 다른 DB 테이블에 저장된다면, 테이블마다 값을 쉽게 받아오기 위해 VO 객체가 필요할 것이므로, VO를 따로 만들어주는 것이 좋다.   
  
- 사용자가 (1) 첨부파일을 안올리는 경우도 있고 (2) 한 개의 첨부파일을 올리는 경우도 있을 것이다. 

- 그래서 첨부파일마다 컬럼을 만들게 되면, 공백이 존재하는 L자 패턴 데이터가 만들어질 수 있다. 

- 공백으로 저장되는 데이터가 많아진다면, 테이블을 분리해서 만들어주는 것이 좋다. 

![image](https://user-images.githubusercontent.com/77392444/123914875-d96ee500-d9ba-11eb-81c9-7ce45b60d5fe.png)

- 코드 : 

```jsp
<%
	request.setCharacterEncoding("utf-8");

  // 파일 저장 경로
	String saveDirectory = "C:/kopo-05-web/code/Mission-Web/WebContent/upload";
	
  // MultipartRequest 객체
	MultipartRequest multiRequest = new MultipartRequest(
											request,
											saveDirectory,
											1024 * 1024 * 3,
											"utf-8",
											new KopoFileNamePolicy()
									);
%>
```

- 파일 경로 구분자 : (1) `\\` (윈도우 방식) , (2) `/` (리눅스) 
  
- MultipartRequest 생성자 : 

```java
MultipartRequest(
  javax.servlet.http.HttpServletRequest request, 
  java.lang.String saveDirectory, 
  int maxPostSize, 
  java.lang.String encoding, 
  FileRenamePolicy policy
) 
```



### 7. db에 저장하기

  
  
#### t_board_file 테이블에 삽입할 게시물 번호는 어떻게 추출할까?
  
- seq_t_board_no의 current.val를 받아오면 될까?
  
  - 다중 사용자가 동시에 데이터를 삽입하게 되면, current.val값이 애매해진다. 
  
- 이러한 문제를 해결하기 위해 시퀀스 번호를 따로 추출해야 한다. 

  - Insert할때, sequence 번호를 추출하는 것이 아니라, 따로 sequence 번호를 추출해서 t_board에도 넣고 t_board_file에도 넣어주는 방법이 있다. 

  
### 8. 상세 페이지에 파일 출력하기
  
  
### 9. 파일 다운로드 가능하게 만들기
