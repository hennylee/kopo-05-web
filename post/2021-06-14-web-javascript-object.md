## 자바스크립트의 객체와 배열

- 배열 : `[]`

- 객체 : `{}`

- 자바스크립트에서 객체는 `key` 와 `value` 쌍으로 구성된다.

- 자바스크립트에서 `key`는 무조건 문자열이기 때문에 작은따옴표(`''`)를 생략해도 된다. 
  - 단, 특수문자가 있는 경우에는 작은따옴표를 생략할 수 없다.

- 자바스크립트에서는 동적으로 객체를 추가/삭제할 수 있다.

- 객체에 해당 key가 있는지 확인해볼때는 `('name' in person)` 와 같이 `in` 연산자를 사용할 수 있다. 


## this

- 자바스크립트에서는 `this` 키워드를 생략할 수 없다. 

- 그래서 객체 내의 요소를 지칭할 때는 `this.key명`을 작성하면 된다. 



## with

- with문은 객체를 제어하는 명령어이다.

- with문은 특정 객체를 여러번 사용 할 경우, 그 특정 객체를 생략 할 수 있도록 도와 준다.

- with문 사용법

```
with(반복시킬 구문){
    생략된 구문
}
```

## for in

- 배열에서와 달리 객체에서의 for in 연산자는 객체의 각 요소를 출력할 수 있다.

- 객체에서 for of로 각 요소를 출력해내려면 `Object.keys(객체명)`를 사용해야 한다.

![image](https://user-images.githubusercontent.com/77392444/121877714-e0082600-cd45-11eb-8231-f33a118f11a5.png)



## 객체 생성

```js
{ %raw% }
<script type="text/javascript">

	function makePerson(name, phone, addr) {
		let person = {
				'name' : name,
				'phone' : phone,
				'addr' : addr,
				'info' : function(){
					let msg = ''
					for(let key in this){
						if(key != 'info')
							msg += key + ' : ' + this[key] + '<br>'
					}
					document.write(msg)
				}
		}
		return person
	}
	
	/* 객체 1개만 생성하기  */
	let p = makePerson('홍길동', '010-1212-1111', '경기도 고양시')
	p.info()
	document.write('<hr>')
	console.log(p)
	
	/* 객체 여러개 배열로 담기 */
	let persons = []
	persons.push(makePerson('홍길동', '010-1212-1111', '경기도 고양시'))
	persons.push(makePerson('홍길순', '010-2222-3333', '서울시 강남구'))
	
	/* of 쓰면 객체 받기, in 쓰면 index 받기 */
	for(let p of persons){
		p.info()
		document.write('<br>')
	}
	
</script>
{ %endraw% }
```



## 생성자 함수

- 기존 함수에 new 연산자를 붙여서 호출하면, 해당 함수는 생성자 함수로 동작한다.

- 그런데 함수가 일반적인 함수인지 객체를 만들기 위한 목적의 생성자 함수인지 구분하기 위해, 생성자 함수의 첫 문자는 대문자로 표기하는 것이 관례이다.

- 생성자 함수를 통해 객체를 생성하면 같은 속성을 가진 객체를 여러 개 생성할 수 있습니다.

- 즉, person1과 person2 객체는 name, email, walk 프로퍼티를 갖게 되며, 이 방식은 클래스를 통해 객체를 생성하는 것과 유사하지만 클래스는 아니다.

- 자바 스크립트에서는 클래스 개념이 없다. new를 사용한다고 해서 자바에서처럼 클래스가 생성되는 개념이 아니다. 



## 프로토타입

- 자바스크립트에서 proto를 가지고 있으면 객체, proto를 가지고 있지 않으면 객체가 아니다. 

- 자바스크립트에서 상속은 클래스 상속이 아니고, 프로토타입을 가지고 있는지가 중요하다.

- 두 객체가 공통으로 사용하는 부분을 prototype이라고 생각할 수 있다. 

- 프로토타입은 생성자(new)를 가지고 있는 객체에서만 사용할 수 있다.




## 객체에 접근하지 못하게 하는 방법 : 캡슐화

- 5버전 까지의 캡슐화
  - 임의의 일반 변수로 가지고 있고, getter/setter를 통해 access할 수 있도록만 만들어주는 방식이다.


```javascript
{ %raw% }
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
{ %endraw% }
```

- 6버전부터는 클래스를 사용한다.
  - 이 클래스가 자바의 객체지향적 클래스는 아니다. 
  - 실제 자바스크립트에서는 프로토타입이다. 



## 얕은 복사 vs 깊은 복사
- 얕은 복사는 객체의 주소값만 복사하는 것이다. `let person2 = person`

- 깊은 복사는 객체의 key, value 를 전부 복사해놔야 한다. 

- `let person4 = {...person}`처럼 전개 연산자를 사용한다면 깊은 복사를 쉽게 할 수 있다. 
