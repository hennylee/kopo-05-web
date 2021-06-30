-- 파일 저장 테이블 생성
create table t_board_file(
    no number(5) primary key
    , board_no number(5) not null
    , file_ori_name varchar2(300)
    , file_save_name varchar2(300)
    , file_size number(10)
    , constraint t_board_file_no_fk foreign key(board_no)
    references t_board(no)
);

-- 시퀀스 생성
create sequence seq_t_board_file_no nocache;


-- 전체 파일 조회
select * from T_BOARD_FILE;
