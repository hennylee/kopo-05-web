-- 오픈뱅킹 서비스를 신청한 회원
<<<<<<< Updated upstream
drop table hn_open_register;

create table hn_open_register(
    member_id varchar(50),-- 회원 아이디
    regdate date default sysdate ,-- 신청일자
    password number not null, -- 비밀번호
=======
create table hn_open_register(
    member_id varchar(50),-- 회원 아이디
    agree_no number(38) not null,    -- 정보 동의 no
    regdate date default sysdate ,-- 신청일자
>>>>>>> Stashed changes
    CONSTRAINT hn_open_register_id_pk PRIMARY key(member_id)
);



<<<<<<< Updated upstream
-- 오븐뱅킹 정보 동의 번호 시퀀스
drop sequence seq_hn_open_agreement;
=======
-- 오픈뱅킹 정보 동의 현황
create table hn_open_agreement(
    no number(38),
    member_id varchar(50) not null,-- 회원 id
    policy varchar(50) UNIQUE, -- 정책
    regdate date default sysdate, -- 동의일자
    agreement char(1) default 'N' not null,
    CONSTRAINT hn_open_agreement_no_pk PRIMARY key(no) -- 동의여부 default 'Y'
);

-- 오븐뱅킹 정보 동의 번호 시퀀스
>>>>>>> Stashed changes
create sequence seq_hn_open_agreement nocache;
