-- HN은행 회원테이블
create table hn_member(
    id varchar2(20),
    name varchar2(20) not null,
    resident_num1 char(6) not null,
    resident_num2 char(7) not null,
    password varchar2(20) not null,
    email_id varchar2(30),
    email_domain varchar2(20),
    tel1 char(3),
    tel2 char(4),
    tel3 char(4),
    post char(7),
    basic_addr varchar2(200),
    detail_addr varchar2(200),
    type char(1) default 'U',
    reg_date date default sysdate,
    CONSTRAINT hn_member_id_pk PRIMARY key(id)    
);





-- HN은행 회원 더미 데이터　＆　회원가입
INSERT INTO hn_member VALUES(
'test'
, '테스트'
,'959912'
,'2222222'
, '1111'
,'nee1202'
,'naver.com'
,'010'
, '2121'
,'7514'
,41220
,'경기도 고양시 덕양구 화신로76'
,'101-601'
,'U'
,sysdate);

commit;


-- 로그인
select id, name, type 
from hn_member
where id = 'test' and password = '1111' and type = 'U' ;

-- 회원가입

INSERT INTO hn_member(
    id
    ,name
    ,resident_num1
    ,resident_num2
    ,password
    ,email_id
    ,email_domain
    ,tel1
    ,tel2
    ,tel3
    ,post
    ,basic_addr
    ,detail_addr
    ,type
)
VALUES(
'test1'
, '테스트1'
,'892222'
,'1111111'
, '1111'
,'test02'
,'naver.com'
,'010'
, '1233'
,'3434'
,98880
,'서울'
,'1234-3463'
,'U');

commit;
