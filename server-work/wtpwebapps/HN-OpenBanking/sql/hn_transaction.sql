-- 거래 내역
create table hn_transaction(
    trans_no number(38), -- 거래 고유 번호
    account_num varchar(50) not null,
    target_name varchar(50) not null,
    trans_date date default sysdate,
    trans_amount number(38) not null,
    CONSTRAINT hn_transaction_no_pk PRIMARY key(trans_no)
);

create SEQUENCE seq_hn_transaction nocache;

/*

계좌 이체 : 

<transfer.jsp>
1. 내 계좌 선택 


(내 계좌 기억) => 폼태그로 히든 전송 => 세션에 저장해두기
- 문제 : 체크한 값을 자바스크립트에서 아는데 어캐 전송하지....?


2. 상대방 계좌/은행 입력 => 존재하는지 확인(ajax로 결과 받아와야함)

(상대방 계좌 / 은행 기억) => 폼태그로 히든 전송 => 세션에 저장해두기



3. 이체할 금액 입력 => 내 잔액보다 많지 않은지 확인(ajax로 결과 받아와야 함)

(이체할 금액 기억) => 



4. 
1) 내 통장에서 출금 => 내 계좌테이블 잔액 변경
2) 내 거래내역에 기록 => 내 거래테이블에 기록 : 보낸날짜, 받을 계좌주, 보낸 금액, 내 계좌번호 
3) 상대방 통장에 입금 => 상대방 계좌테이블 잔액 변경
4) 상대방 거래내역에 기록 => 
*/

-- 알고 있는 정보 : 내 계좌, 상대 계좌, 상대 은행, 보낼 금액
select * from hn_account;
select * from hn_transaction;


-- 1) 보낼 수 있는 잔고 있는지 확인 (0이면 실패)
select count(*)
from hn_account a --, hn_member b
where --a.member_id = b.id and 
a.account =  '99999-999999' --'88888-88888'
and (a.balance - 1000) > 0;

-- 2) 잔고 있으면, 잔액 update
update hn_account set balance = balance - 1000 where account = '99999-999999';


-- 3) 내 거래 내역에 기록
insert into hn_transaction(trans_no, account_num, target_name, trans_amount) 
values(seq_hn_transaction.nextval, '99999-999999', (select name from hn_account a, hn_member b where a.member_id = b.id and a.account = '000002331948'), -1000);


-- 4) 상대방 통장에 입금(잔액 update)
update hn_account set balance = balance + 1000 where account = '000002331948';


-- 5) 상대방 거래내역에 기록  
insert into hn_transaction(trans_no, account_num, target_name, trans_amount) 
values(seq_hn_transaction.nextval, '000002331948', (select name from hn_account a, hn_member b where a.member_id = b.id and a.account = '99999-999999'), 1000);

ROLLBACK;



-- 프로시저
SET SERVEROUTPUT ON

drop PROCEDURE pro_hn_transaction;

CREATE OR REPLACE PROCEDURE pro_hn_transaction(
    my_account IN VARCHAR2 -- 내 계좌
    ,target_account IN VARCHAR2  -- 상대 계좌
    , target_bank IN CHAR -- 상대 은행
   ,trans_amount IN NUMBER -- 거래 금액
)
AS
    V_MY_NAME        hn_member.name%TYPE;
    V_MY_BALANCE            hn_account.balance%TYPE;
    V_TARGET_NAME        hn_member.name%TYPE;
    V_TARGET_BALANCE   hn_account.balance%TYPE;
    V_BALANCE_CHECK NUMBER := -1;
BEGIN
    -- 1-1. 내 계좌 이름 매핑
    SELECT NAME INTO V_MY_NAME from hn_account a, hn_member b where a.member_id = b.id and a.account = my_account;
    DBMS_OUTPUT.PUT_LINE('V_MY_NAME => ' || V_MY_NAME);
    -- 1-2. 상대 계좌 이름 매핑
    SELECT NAME INTO V_TARGET_NAME from hn_account a, hn_member b where a.member_id = b.id and a.account = target_account;
    DBMS_OUTPUT.PUT_LINE('V_TARGET_NAME => ' || V_TARGET_NAME);
    
    -- 2. 내 잔액 update
    update hn_account set balance = balance - trans_amount where account = my_account;
    
    -- 3) 내 거래 내역에 기록
    insert into hn_transaction(trans_no, account_num, target_name, trans_amount) 
    values(seq_hn_transaction.nextval, my_account, V_TARGET_NAME , -1 * trans_amount);
    
    -- 4) 상대방 통장에 입금(잔액 update)
    update hn_account set balance = balance + trans_amount where account = target_account;
    
    -- 5) 상대방 거래내역에 기록  
    insert into hn_transaction(trans_no, account_num, target_name, trans_amount) 
    values(seq_hn_transaction.nextval, target_account, V_MY_NAME, trans_amount);
    
    COMMIT;
    
EXCEPTION
     WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('OTHERS => : '||SQLERRM);
        ROLLBACK;
END pro_hn_transaction;
/

--execute pro_hn_transaction('99999-999999', '000002331948', '3000', 1000 );

