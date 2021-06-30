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

-- 회원전체 조회
select * from t_member;

-- 회원전체 삭제
delete from t_member;

-- ID중복체크
select count(*) from t_member where id = 'test01';

-- 로그인
select count(*) from t_member where id = 'test01' and password='1111';
select * from t_member where id = 'test01' and password='';

select * from t_member where id = 'test01';

-- 일반회원 가입
insert into t_member
(id, name, password, email_id, email_domain,tel1, tel2, tel3, post, basic_addr,detail_addr) 
values(
    'test01',
    '테스트회원01',
    '1111',
    'test01',
    'naver.com',
    '010',
    '1111',
    '1111',
    '02134',
    '경기도 광명시 철산리',
    '한국폴리텍대학 401호'
);

commit;


-- 관리자 회원가입
insert into t_member(id, name, password, email_id, email_domain,tel1, tel2, tel3, post, basic_addr,detail_addr) )
values('admin01', '관리자01', '1111', 'admin01', 'daum.net', '010', '8888', '8888','39485', '인천광역시'
, '구리로', 'S', SYSDATE);

COMMIT;


