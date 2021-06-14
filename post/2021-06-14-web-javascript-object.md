## 자바스크립트의 객체와 배열

- 배열 : `[]`

- 객체 : `{}`

- 자바스크립트에서 객체는 `key` 와 `value` 쌍으로 구성된다.

- 자바스크립트에서 `key`는 무조건 문자열이기 때문에 작은따옴표(`''`)를 생략해도 된다. 
  - 단, 특수문자가 있는 경우에는 작은따옴표를 생략할 수 없다.

- 자바스크립트에서는 동적으로 객체를 추가/삭제할 수 있다.


## this

- 자바스크립트에서는 `this` 키워드를 생략할 수 없다. 

## 프로토타입

- 자바스크립트에서 상속은 클래스 : 클래스가 아니고, 프로토타입을 가지고 있는지가 중요하다.

- 프로토타입은 생성자(new)를 가지고 있는 객체에서만 사용할 수 있다.



## 객체 함수

## 생성자 함수
- 자바 스크립트에서는 클래스 개념이 없다. new를 사용한다고 해서 자바에서처럼 클래스가 생성되는 개념이 아니다. 
- 자바스크립트에서 proto를 가지고 있으면 객체, proto를 가지고 있지 않으면 객체가 아니다. 


- 두 객체가 공통으로 사용하는 부분을 prototype이라고 생각할 수 있다. 


## with

- with문은 객체를 제어하는 명령어이다.
- with문은 특정 객체를 여러번 사용 할 경우, 그 특정 객체를 생략 할 수 있도록 도와 준다.

- with문 사용법

```
with(반복시킬 구문){
    생략된 구문
}
```


## 객체에 접근하지 못하게 하는 방법 : 캡슐화

- 5버전 까지의 캡슐화
  - 임의의 일반 변수로 가지고 있고, getter/setter를 통해 access할 수 있도록만 만들어주는 방식이다.


```javascript
function Person(n, p, a){
  let name = n
  let phone = p
  let addr = a

  this.getName = function() {
    return name
  }

  this.setName = function(n) {
    name = n
  }
}
```

- 6버전부터는 클래스를 사용한다.
  - 이 클래스가 자바의 객체지향적 클래스는 아니다. 
  - 실제 자바스크립트에서는 프로토타입이다. 



## 얕은 복사 vs 깊은 복사

- 전개 연산자를 사용해서 깊은 복사를 쉽게 할 수 있다. 