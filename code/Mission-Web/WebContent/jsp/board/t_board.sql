-- 게시물 수정

select * from T_BOARD;

--update t_board set (title, content) = ( '제목수정test' , '내용수정test') where no = '1';

update t_board set 
title = '제목수정test', content = '내용수정test'
where no = '1';

rollback;


-- 조회수 증가
select view_cnt from t_board where no = '1';

update t_board set view_cnt = (select (view_cnt + 1) from t_board where no = '1') where no = '1';
rollback;

update t_board set view_cnt = view_cnt + 1 where no = '1';
rollback;

update t_board set view_cnt = (select (view_cnt + 1) from t_board where no = 1)where no = 1 ;


-- 게시물 삭제
delete from t_board where no = '1';
rollback;