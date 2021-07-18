-- 회원테이블
create table t_member(
    id varchar2(20),
    name varchar2(20) not null,
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
    CONSTRAINT t_member_id_pk PRIMARY key(id)    
);

-- 가상 회원 데이터 입력
INSERT INTO t_member VALUES(
'test'
, '테스트'
, '1111'
,'nee1202'
,'naver.com'
,'010'
, '2121'
,'7514'
,41220
,'주소1'
,'주소2'
,'U'
,sysdate);

commit;