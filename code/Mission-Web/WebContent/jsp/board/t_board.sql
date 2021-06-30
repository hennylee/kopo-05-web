-- 게시판 테이블 생성
CREATE TABLE T_BOARD
(	"NO" NUMBER(5,0) primary key, 
    "TITLE" VARCHAR2(300 BYTE),
    "WRITER" VARCHAR2(100 BYTE),
    "CONTENT" VARCHAR2(2000 BYTE),
    "VIEW_CNT" NUMBER(5,0) DEFAULT 0, 
    "REG_DATE" DATE DEFAULT sysdate 
);


-- 게시물 조회
select * from T_BOARD;

-- 게시물 수정
--update t_board set (title, content) = ( '제목수정test' , '내용수정test') where no = '1';

update t_board set 
title = '제목수정test', content = '내용수정test'
where no = '1';

rollback;


-- 조회수 증가
update t_board set view_cnt = view_cnt + 1 where no = 1;

select view_cnt from t_board where no = 1;

--update t_board set view_cnt = (select (view_cnt + 1) from t_board where no = 1) where no = '1';
rollback;



-- 게시물 삭제
delete from t_board where no = 1;
rollback;