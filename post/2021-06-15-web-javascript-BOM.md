
## BOM (브라우저 객체 모델)

- window 객체 : 브라우저의 최상의 객체
  - location : url 주소와 관련
  - screen : 창크기를 늘리기 / 줄이기
  - history : 뒤로가기, 앞으로 가기
  - document : body 태그의 내용이 담기는 객체
  - navigator 


## location

- url 이동시키기
  - `location.href = '' `
  - `location = '' `
  - `location.assign('')`
  - `location.replace('')` : 뒤로가기가 안먹힘


## history

- `history.back` : 뒤로가기

- `history.go(n)` : 특정 지점으로 이동하기, 현재 = 0이다. -1, -2...는 n번째 뒤로 가기, +1, +2,...는 n번째 앞으로 가기

## onload

- body 태그 속성에 `onload="autoCall()"`가 있다면 body 태그가 다 읽어지면...onload라는 속성이 무조건 실행된다. 

- 웹브라우저의 body 태그의 내용이 다 출력되어야만 onload의 속성이 실행되기 때문에, 화면에 출력할 용량이 크다면 onload 속성은 늦게 실행될 수 밖에 없다. 

- 이때, window.onload 함수를 사용하면, body의 내용이 다 해석되고 화면에 아직 다 출력되지 않아도 먼저 실행된다. 

- window.onload가 여러개 있더라도, 자바스크립트의 덮어쓰기 특성 상 마지막 함수만 시작된다. 

- body 태그의 onload 속성과 자바스크립트의 window.onload 함수는 동시에 사용할 수 없다. 
