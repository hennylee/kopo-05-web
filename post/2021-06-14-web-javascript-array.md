## 자바스크립트 배열의 특징

- 자바스크립트에서는 배열에 모든 데이터 형을 관계없이 집어넣을 수 있다.

- `undifined`나 `null` 값이 배열에 추가되면 공백으로 찍힌다. 

- 자바 스크립트에서 배열자체는 객체로 인식되기 때문에 `typeof(배열이름)` 은 object이다.

- 배열에 값을 추가할 때는 `array[array.length] = '추가'` 처럼 특정 인덱스에 값을 집어넣어도 되고, `push(추가할 값)` 메소드를 활용해도 된다.

- 배열의 길이는 `배열이름.length`로 확인할 수 있다. 



## key가 문자인 배열

- 자바스크립트에서 배열의 index에는 숫자 뿐 아니라 문자가 올 수도 있다. 

- 이때도 배열의 숫자 index와 같이 각 index에는 하나의 값만 매칭된다. 

```js
state['서초'] = '서울특별시'
state['광명'] = '경기도'
state['동래'] = '부산광역시'

state['서초'] = '미지정' // '서초' index의 값이 '서울특별시'에서 '미지정'으로 덮어써짐
```


## 자바스크립트 배열과 Stack

- 자바스크립트의 배열은 크기가 유연하게 늘어나기 때문에 중간에 자동으로 빈 데이터가 추가된다. 

- 이 때, `push()`, `pop()` 메소드는 배열의 중간에 빈 데이터 없이 추가/삭제하는 방법이다. 

- 이 메소드들은 stack이라고 하는 메모리 구조와 관련이 있다. 

- stack 자료구조는 os 스케줄링과 관련이 있다.



## 자바스크립트 배열의 출력

- 기본 for문 : 자바와 동일

- `for ~ in` 
  - 형식 : `for(let i in names){ ... }` 
  - index를 뽑아내는 방식이다.

- `for ~ of`
  - 형식 : `for(let name of names){ ... }` 
  - 객체를 뽑아내는 방식이다.


## forEach 함수

- 6버전에서 추가된 함수이다.

- 형식 : 

```js
배열이름.forEach(function() {
  // 콜백함수 내용
})
```

- forEach는 배열의 요소가 하나씩 들어올 때마다 forEach의 콜백함수로 돌리는 것이다.

```javascript
{ % raw % }
let books = ['백설공주', '신데렐라', '콩쥐팥쥐', '피터팬']

books.forEach(function(element, index, array){
		// console.log(arguments) : 넘어오는 인자 확인(element, index, array)
		document.write(element + "&nbsp;&nbsp;&nbsp;" )
	})
	document.write('<br>')
{ % endraw % }
```


- for in, for of와 같이 배열의 값을 찍어볼때 사용할 수 있다. 

## map


## 깊은 복사 vs 얕은 복사

- 복사하려는 배열 : `let array = [1, 2, 3, 4, 5] `

- 얕은 복사는 주소값만 복사해서, 하나의 데이터 변경 시 복사한 데이터 전부 값이 변경된다. 

```javascript
{ % raw % }
let array2 = array
{ % endraw % }
```

- 배열의 깊은복사는 배열 값을 하나하나 전부 복사해야 한다. 

```javascript
{ % raw % }
for(let i in array){
  array3[i] = array[i]
}
{ % endraw % }
```


- 깊은 복사를 쉽게 하려면 전개 연산자를 사용할 수 있다. 

```javascript
{ % raw % }
let array4 = [...array]
{ % endraw % }
```

- 각 요소를 조작해서 깊은 복사하기 : push 활용
- 각 요소를 조작해서 깊은 복사하기 : map 활용
- return에 조건문 써서 짝수값만 깊은 복사 



## every / some 함수

- every 함수 : 조건을 모두 만족하면 true, 하나라도 만족하지 못하면 false를 return한다. 

- some 함수 : 적어도 1개 이상 만족하면 true, 하나도 만족하지 않으면 false를 return한다. 





## 배열의 정렬

- 문자열 정렬

- 숫자 정렬 : 오름차순 / 내림차순


## 배열의 총합 구하기

- reduce
- reduceRight
