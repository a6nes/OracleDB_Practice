-- 04_DDL_Alter.sql

-- 생성
create table 테이블이름();
create user scott identified by tiger;

-- 수정
alter table 테이블이름 <수정내용>;
alter user 유저이름 identified by 비밀번호;


-- 1. 필드명의 변경
ALTER TABLE 테이블이름 RENAME COLUMN 변경전필드이름 TO 변경후필드이름;

-- booklist 테이블의 subject 필드명을 title로 수정합니다.
ALTER TABLE booklist RENAME COLUMN subject TO title;
SELECT * FROM booklist;

-- 반대로 title 필드명을 subject 필드명으로 수정합니다
alter table booklist rename column title to subject;

-- booklist의 outprice 필드의 이름을 rentprice 로 수정하세요
alter table booklist rename column outprice to rentprice;

-- memberlist 테이블의 membername 필드를 name으로 변경하세요
alter table memberlist rename column membername to name;
select*from memberlist;

-- rentlist 테이블의 rent_date 필드를 rentdate로 변경하세요
alter table rentlist rename column rent_date to rentdate;
select*from rentlist;

-- rentlist 의 idx를 numseq로 변경하세요
alter table rentlist rename column idx to numseq;



-- 2. 필드 자료형의 변경
-- ALTER TABLE 테이블명 MODIFY 필드명 자료형 [디폴트값이나 제약사항]

-- varchar2(12) 였던 memberlist 테이블의 name 필드를 varchar2(30)으로 변경
alter table memberlist modify name varchar2(30);

-- booklist의 booknum 필드를 number(5)로 자료형 변경
alter table booklist modify booknum number(5); -- 수정실패

-- memberlist 의 membernum 필드를 number(5)로 자료형 변경
alter table memberlist modify membernum number(5); -- 수정실패

-- rentlist의 bnum 필드를 number(5)로 자료형 변경
alter table rentlist modify bnum number(5); -- 수정실패

-- rentlist의 mnum 필드를 number(5)로 자료형 변경
alter table rentlist modify mnum number(5); -- 수정실패

-- 외래키로 연결되어서 참조되고, 참조하고 있는 필드들은 위의 명령으로 수정이 바로 불가능합니다.
-- 가능하게 하려면, 외래키 제약 조건을 수정하여 없애버리고, 참조되는 필드와 참조하는 필드를
-- 모두 수정한 후 외래키 제약 조건을 다시 설정합니다.
-- alter 명령에 의해서 제약조건을 수정 또는 삭제하는 명령을 아래에서 학습합니다.


-- 3. 필드의 추가
-- ALTER TABLE 테이블명 ADD 필드명 자료형

-- booklist에 구매등급을 저장할 수 있는 grade 필드를 varchar2(15)로 추가
alter table booklist add grade varchar2(15);

-- memberlist 에 성별(gender)필드를 varchar2(3)으로 추가
alter table memberlist add gender varchar2(3);

-- memberlist에 나이(age)필드를 number(2)로 추가
alter table memberlist add age number(2);
select*from memberlist;
select*from BOOKLIST;



-- 4. 필드의 삭제
-- ALTER TABLE 테이블명 DROP COULMN 필드명

-- memberlist 테이블에서 성별 필드 제거
-- alter table memerlist drop column gender;

-- column = field = attribute = datafield = 열



-- 5. 제약조건의 추가 / 삭제
-- 필드 레벨의 제약조건의 수정 -> modify 명령을 통해서 수정/생성/삭제 합니다.
-- memberlist의 gender필드에 'M' 또는 'F' 둘중에 하나만 입력되게 제약조건을 설정한다면
alter table memberlist modify gender varchar2(3) CHECK(gender = 'M' or gender = 'F');
-- sql에서는 문자와 문자열을 구분하지 않음 ' '만 사용 / == 도 사용하지않고 = 하나로 사용(대입,논리)
alter table memberlist modify gender varchar2(3) CHECK(gender IN('M', 'F'));
-- gender in('F', 'M') : gender 필드값이 in 함수 안에 있는 값들일때만 true를 결과로.


-- 테이블 레벨의 제약조건 생성/삭제
-- 추가 : ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건식
-- 테이블 LEVEL의 제약 조건은 위의 명령 형식으로 제약조건 이름과 함께 추가합니다.

-- memberlist 테이블의 나이(age) 필드에 120살이 초과되는 나이는 입력되지 못하게 제약 조건 추가
ALTER TABLE memberlist ADD CONSTRAINT check_age CHECK ( age<=120 );

-- 테이블 레벨의 제약조건 삭제
-- 삭제 : ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명

-- rentlist 테이블의 bnum에 걸려 있는 외래키 제약조건 제거(fk1)
alter table rentlist DROP CONSTRAINT fk1;

-- rentlist 테이블의 mnum에 걸려 있는 외래키 제약조건 제거(fk2)
alter table rentlist drop constraint fk2;

-- rentlist 테이블의기본키 제거(rent_pk)
alter table rentlist drop constraint rent_pk;





-- booklist의 booknum 필드를 number(5)로 자료형 변경
alter table booklist modify booknum number(5);
-- memberlist의 membernum 필드를 number(5)로 자료형 변경
alter table memberlist modify membernum number(5);
-- rentlist의 bnum 필드를 number(5)로 자료형 변경
alter table rentlist modify bnum number(5);
-- rentlist의 mnum 필드를 number(5)로 자료형 변경
alter table rentlist modify mnum number(5);

select*from booklist;
select*from memberlist;
select*from RENTLIST;

-- rentlist 의 기본키(rent_pk)를 numseq로 설정
alter table rentlist add constraint rent_pk primary key(numseq);

-- rentlist의 외래키 fk1, fk2 재설정
alter table rentlist add constraint fk1 foreign key(bnum) references booklist(booknum);

alter table rentlist add constraint fk2 foreign key(mnum) references memberlist(membernum);



-- 테이블 생성 EX
-- 테이블명 : ORDERS1
-- 필드 :
-- ORDER_ID NUMBER(12,0)		ORDER_DATE	DATE
-- ORDER_MODE VARCHAR2(8)		CUSTOMER_IDNUMBER(6,0)
-- ORDER_STATUS NUMBER(2,0)		ORDER_TOTAL NUMBER(8,2)
-- SALES_REP_ID NUMBER(6,0)		PROMOTION_ID NUMBER(6,0)

-- 제약사항 :
-- 기본키 ORDER_ID - 테이블레벨(제약명 : pk_order)
-- ORDER_MODE 에는 'direct', 'online'만 입력가능 - 테이블레벨(제약명 : ck_order_mode)
-- ORDER_TOTAL의 디폴트 값은 0 - 필드레벨
-- ORDER_DATE 디폴트값 오늘 날짜 - 필드레벨

CREATE TABLE ORDERS1 (

	ORDER_ID NUMBER (12,0), constraint pk_order primary key(ORDER_ID),
	ORDER_MODE VARCHAR2(8), constraint ck_order_mode check(ORDER_MODE in('direct','online')),
	ORDER_STATUS NUMBER(2,0),
	SALES_REP_ID NUMBER(6,0),
	ORDER_DATE DATE default SYSDATE,
	CUSTOMER_ID NUMBER(6,0),
	ORDER_TOTAL NUMBER(8,2) default 0,
	PROMOTION_ID NUMBER(6,0) 
);
select*from ORDERS1;



-- 테이블 수정 EX
-- CUSTOMER_ID 필드명을 CUSTOMER_NUMBER 로 수정
ALTER TABLE ORDERS1 RENAME COLUMN CUSTOMER_ID to CUSTOMER_NUMBER; 

-- Promotion_ID 값은 10000~99999 사이의 값만 저장 가능
ALTER TABLE ORDERS1 add constraint PROMOTION_ID check (PROMOTION_ID >= 10000 and PROMOTION_ID <= 99999);
-- ALTER TABLE ORDERS1 add constraint PROMOTION_ID check (PROMOTION_ID between 10000 and 99999);



-- 테이블의 복사
CREATE TABLE orders2 AS SELECT * FROM orders1;


-- 테이블의 제거
DROP TABLE orders2 purge; -- purge는 생략가능














