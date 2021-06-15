
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


### 마우스 이벤트

- 인라인 이벤트 모델 : DOM에서 level 0 에 설정된 이벤트 모델


- 고전적 이벤트 모델 : DOM level 1 에 설정된 이벤트 모델

### 키보드 이벤트
