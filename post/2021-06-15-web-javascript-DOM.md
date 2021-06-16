
## window.onload

- script 태그는 body 태그보다 먼저 실행되기 때문에 script 내에서는 body 태그의 내용은 읽지 못한다.

- script 태그의 내용이 실행되는 시점에서 body 태그의 내용은 아직 로딩되지 않았기 때문이다.

- 이때, script 태그 내에서 아직 로딩되지 않은 body 태그의 내용에 접근하기 위해서는 `window.onload`를 사용한다. 

- `window.onload`는 자바스크립트에서 페이지가 로드 되면 자동으로 실행되는 전역 콜백함수이다.

- 페이지의 모든 요소들이 로드되어야 호출되며, 한 페이지에서 하나의 window.onload()함수만 적용 가능하다.

- `window.onload`의 사용법은 `window.onload = function () {}` 이다.

- `window.onload` 내에서 document.write가 실행되면 로딩된 body 태그의 내용이 새로운 document로 덮어써진다.



## body 태그 안의 요소에 접근하기

- document.body.table 처럼 접근할 수 없다. 

- body 태그 안의 내용들은 순서가 사용자에 의해 변화하기 때문이다. 

- 그래서 body 태그 안의 요소에 접근하기 위해서는 id, class의 속성을 통해 찾아야 한다. 

- 이때, `document.getElementById`나 `document.getElementsByClassName` 메소드를 활용한다.

- 이외에도 `querySelector`를 사용할 수도 있다. querySelector는 해당 클래스인 태그가 여러개여도 1개만 update한다.

- `querySelectorAll` : 특정 태그를 전부 찾아서 `NodeList(4) [td, td, td, td]`의 배열로 return한다.

- `getElementsByTagName` : 특정 태그를 전부 찾아서 `HTMLCollection(4) [td, td, td, td]`의 배열로 return 한다.



## body 태그 안의 요소의 내용 찾기

- innerText : 이 속성은 element 안의 text 값들만을 가져온다. html코드가 문자열 그대로 element안에 포함된다.

- innerHTML : innerText와는 달리 innerHTML은 element 안의 HTML이나 XML을 가져온다. html element가 element안에 포함된다.



## 동적으로 body 태그에 내용 추가하기

- document.write로 추가하면, 내용을 정적으로밖에 추가할 수밖에 없다. 또 특정 태그 밑에 내용을 추가할 수는 없다. 

- 그래서 태그 따로 만들고, 요소 따로 만드는 방법이 있다. 

- 바로, `createElement`와 `createTextNode` `appendChild` `setAttribute` 를 사용하는 방법이다.



## 동적으로 body 태그에 내용 삭제하기

- `remove` : explore에서는 안먹힘 , 그롬이나 엣지에서만 사용 가능
- `removeChild` : explore에서도 먹히기 때문에 자주 사용된다. 다만, removeChild를 사용하기 위해서는 특정 태그의 parentNode를 찾아야 하는 번거로움이 있다.



## 동적으로 css 속성 바꾸기

- style 에서 폰트 사이즈, border 등의 속성을 변경할 수 있다. 



## 이벤트

- 인라인 이벤트 모델 DOM에서 level 0 : html 태그 속성에서 실행할 함수 설정해주는 방법

- 고전적 이벤트 모델 DOM level 1 : 자바스크립트에서 onclick 함수 설정

- 표준 이벤트 모델 DOM Level2 : addEventListener(eventName, handler,useCapture), removeEventListener()
  - eventName : 이벤트 이름, handler : 처리함수 , useCapture = true : 부모에서 자식으로...(이벤트 캡처링) 설정



## 이벤트 버블링

- 이벤트 버블링 : 내 부모를 따라 올라가면서 같은 클릭이벤트가 있으면 부모의 이벤트를 자동으로 호출되는 것이다. 

- 이벤트 캡처링 : 자식을 따라가면서 같은 이벤트가 있으면 자식의 이벤트를 자동으로 호출하는 것 

- 이벤트 버블링을 멈추는 방법은? cancelBubble: false 로 설정한다.



## form 태그

- form 태그 특징 : 사용자(클라이언트)가 입력한 정보를 서버쪽에 전달한다. 

- 요청과 관련된 속성 : action, name

- uri를 통해서 날리기 : `action값 ? name값=입력값 & name값=입력값 & name값=입력값`
  - form 태그와 input태그를 함께 쓸때는 반드시 name값을 설정해줘야 한다. 
  - `?` 뒷부분을 `쿼리 String` 이라고 한다.

![image](https://user-images.githubusercontent.com/77392444/122143304-34b5b900-ce8c-11eb-808d-a7e234a02372.png)

- submit 전에 id와 passoword를 무조건 입력하게 하려면?
  - 예전에는 서버가 받아서 확인하는 정적인 방법을 사용했다. 
  - 하지만 요청/응답은 I/O로 움직이기 때문에 느려서 요청/응답이 자주 발생하는 것은 좋지 않다. 
  - 또 TCP 프로토콜이라 요청이 다 올때까지 기다리기 때문에 속도가 느릴 수밖에 없다. 
  - 그래서 서버에 보내기 전에 검증을 먼저 해야한다.


- 클라이언트 입력 검증 방법
  - input태그에 required 속성을 통해 값이 입력되지 않았으면 서버에 전송하지 않도록 설정할 수 있다.

  - form 태그에 onsubmit 속성의 return false/true를 통해 서버에 전송할지 말지를 설정할 수 있다.
  - 이때, `return 함수이름()` 처럼 자바스크립트에서 DOM level 1 처리를 할 수도 있다.

![image](https://user-images.githubusercontent.com/77392444/122143394-5d3db300-ce8c-11eb-9201-968211f89da2.png)


- form태그만 유일하게 name 속성을 통해서 접근할 수 있다.

![image](https://user-images.githubusercontent.com/77392444/122148009-dfca7080-ce94-11eb-8b79-8cff6dcb22dd.png)


