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
{ % raw % }
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
{ % endraw % }
```



## 생성자 함수

- 기존 함수에 new 연산자를 붙여서 호출하면, 해당 함수는 생성자 함수로 동작한다.

- 그런데 함수가 일반적인 함수인지 객체를 만들기 위한 목적의 생성자 함수인지 구분하기 위해, 생성자 함수의 첫 문자는 대문자로 표기하는 것이 관례이다.

- 생성자 함수를 통해 객체를 생성하면 같은 속성을 가진 객체를 여러 개 생성할 수 있습니다.

- 즉, person1과 person2 객체는 name, email, walk 프로퍼티를 갖게 되며, 이 방식은 클래스를 통해 객체를 생성하는 것과 유사하지만 클래스는 아니다.

- 자바 스크립트에서는 클래스 개념이 없다. new를 사용한다고 해서 자바에서처럼 클래스가 생성되는 개념이 아니다. 

- 자바스크립트는 동적으로 객체의 key를 추가할 수 있다.

- 사람 객체 생성자 함수 예시 : 

```js
{% raw %}
<script type="text/javascript">
	function Person(name, phone, addr){
		this.name = name
		this.phone = phone
		this.addr = addr
	}

	// prototype (1) : 공통 취미
	Person.prototype.hobby = '영화감상'
	
	// prototype (2) : 정보 출력
	Person.prototype.info = function(){
		let msg = ''
		for(let key in this){
			if(key != 'info')
				msg += key += ' : ' + this[key] + '<br>'
		}
		document.write(msg)
	}
	
	// 사람 객체 생성
	let p = new Person("홍길동", "010-1111-1111", "경기도 광명시")
	p.info()
	console.log(p)
	
</script>
{% endraw %}
```

![image](https://user-images.githubusercontent.com/77392444/121975107-d02b2900-cdbb-11eb-993d-cfa7630ceecf.png)


![image](https://user-images.githubusercontent.com/77392444/121974997-9f4af400-cdbb-11eb-836a-5867029222aa.png)





## 프로토타입

- 자바스크립트에서 proto를 가지고 있으면 객체, proto를 가지고 있지 않으면 객체가 아니다. 

- 두 객체가 공통으로 사용하는 부분을 prototype이라고 생각할 수 있다. 

- 프로토타입은 생성자(new)를 가지고 있는 객체에서만 사용할 수 있다.

- 자바스크립트에서 상속은 클래스 상속이 아니고, 프로토타입을 가지고 있는지가 중요하다.

- 그래서 




## 객체에 접근하지 못하게 하는 방법 : 캡슐화

- 5버전 까지의 캡슐화
  - 임의의 일반 변수로 가지고 있고, getter/setter를 통해 access할 수 있도록만 만들어주는 방식이다.


```javascript
{ % raw % }
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
{ % endraw % }
```

- 6버전부터는 클래스를 사용한다.
  - 이 클래스가 자바의 객체지향적 클래스는 아니다. 
  - 실제 자바스크립트에서는 프로토타입이다. 



## 얕은 복사 vs 깊은 복사
- 얕은 복사는 객체의 주소값만 복사하는 것이다. `let person2 = person`

- 깊은 복사는 객체의 key, value 를 전부 복사해놔야 한다. 

- `let person4 = {...person}`처럼 전개 연산자를 사용한다면 깊은 복사를 쉽게 할 수 있다. 




## class를 통해 객체 생성하기
- ECM6버전부터 클래스 개념이 생겼다.

- 클래스도 내부적으로는 prototype으로 바뀐다. 

- 그래서 class와 생성자 함수는 같다고 볼 수 있다. 단지 개발자들이 이해하기 쉽게 문법만 바뀐 것이다. 

- 클래스에서는 생성자 함수 대신 constructor를 사용하기 때문에 function 키워드가 불필요하다.

![image](https://user-images.githubusercontent.com/77392444/121977145-3fa31780-cdc0-11eb-8823-cd034b68cbdf.png)


### class 은닉화

- 은닉화 : 멤버 변수 앞에 `_` 붙이고 getter/setter 메소드를 만들어서 `_`가 붙은 멤버변수에 접근하도록 한다.


### class 상속

- 자바와 동일하게 extends 키워드를 사용하면 된다. 

- 상속 후, constructor에서 super 키워드로 상속받은 멤버변수를 받아줘야 한다. 



## 내장객체

- Number, String, Array, Math, Object, Date 등이 있다. 

- Number 내장객체

```js
num = 12.34
// 12.34

num.toFixed(1)
// "12.3"
```

- String 내장객체 : 자바와 유사하지만, css와 관련된 메소드들이 존재한다. 

![image](https://user-images.githubusercontent.com/77392444/121981830-60239f80-cdc9-11eb-87df-cd96298c2ae8.png)


- CSS와 관련된 String 내장객체

	- bold() : b태그가 붙은 효과를 낸다. 

	- fontcolor(색상) : 폰트 색상을 변경한다. 

	- fontsize('20pt') : 폰트 크기를 변경한다. 

	- link(url) : a태그를 붙여줘서 하이퍼링크로 만들어준다. 


- Date 내장객체


## JSON

- `JSON.parse()` : 문자열을 자바스크립트 객체로 변환, eval()은 보안에 불리하기 때문에 parse 명령어를 많이 쓴다. 

- `JSON.stringify()` : 자바스크립트 객체를 문자열로 변환

