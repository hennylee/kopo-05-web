

- JSTL 의 함수는 태그가 아니다.

- 문자열 객체 뿐 아니라 배열 객체에도 적용 가능하다. 

## JSTL 함수(fn)의 종류

|함수 |설명|
|------|--------------------------|
|fn:length(obj)|List와 같은 Collection인 경우 저장된 개수를 반환, 문자열일 경우 문자열의 길이를 리턴
|fn:substring(str, idx1, idx2) |str의 내용에서 idx1 위치에서 idx2 – 1 사이의 문자열 반환|
|fn:trim(str) |str 좌우의 공백문자를 제거|
|fn:replace(str, src, dest)| str에 있는 src를 dest로 변환|
|fn:indexOf(str1, str2) |str1에서 str2가 위치한 인덱스를 구한다.|
|fn:startsWith(str1, str2)|str1이 str2로 시작할 경우 true를, 그렇지 않을 경우 false를 리턴한다.|
|fn:endsWith(str1, str2)|str1이 str2로 끝나는 경우 true를, 그렇지 않을 경우 false를 리턴한다.|
|fn:contains(str1, str2) |str1이 str2를 포함하고 있을 경우 true를 리턴한다.|

