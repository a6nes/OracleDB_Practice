-- 08_DML_SELECT.sql

-- 오라클 명령어 : select 문(검색)
-- 가장 사용빈도수가 높은 명령

-- [1] scott 사용자가 관리하고 있는 테이블 목록
select*from tab;
select*from tabs;

-- [2] 특정 테이블의 구조 조회(필드 리스트/데이터 형식)
desc booklist; -- 커맨드 창(sqlplus)에서 확인 요망
desc memberlist; -- 커맨드 창(sqlplus)에서 확인 요망

select*from user_constraints; -- 모든 제약사항
select*from user_constraints where table_name = 'RENTLIST'; -- 특정테이블의 제약 사항, 대문자사용
select*from user_constraints where table_name = 'BOOKLIST';
select*from user_constraints where table_name = 'MEMBERLIST';



-- SELECT의 사용법

-- SELECT : select 와 from 사이에 조회하고자 하는 필드명들을 ,로 구분하여 나열합니다.
	select booknum, subject, rentprice from booklist;
-- 모든 필드를 한번에 지목하려면 * 을 써줍니다.	-- select * from...
-- from 뒤에는 대상 테이블 명을 써줍니다.
-- where 절을 붙여서 조건에 맞는 행만 골라내기도 합니다.
	select 필드명들 또는 * from 테이블명 where 검색조건
	
-- 출판년도가 2020년 이후인 도서의 제목과 출판년도를 조회
select subject, makeyear from booklist where makeyear >= 2020;

select * from booklist; -- 검색조건 없이 모든 필드를 다 조회해서 열람


-- 연산의 결과가 필드의 항목을 조회될 수 있습니다.
select rentprice * 10 - inprice from booklist;
select rentprice * 10 - inprice as 마진 from booklist; -- 이름 변경 -> 마진
select subject as 제목, rentprice * 10 - inprice as 마진 from booklist;
select subject as "도서 제목", rentprice * 10 - inprice as "10회대여 마진" from booklist; -- 에러, as 뒤에 별칭에서 공백이 있어서
select booknum || '-' || subject as "book info" from booklist;
-- 오라클 SL 에서 ||는 이어붙이기 연산입니다.



-- 중복제거 distinct
select bnum as 대여도서번호들 from rentlist;
select distinct bnum as 대여도서번호들 from rentlist; -- 중복 제거


-- 함수의 사용
select avg(inprice) as 입고가격평균 from booklist; 


-- 검색 조건 : update와 delete에서 사용하던 where과 사용방식이 똑같습니다.
select*from booklist;
-- memberlist 테이블에서 이름이 '홍'으로 시작하는 회원의 모든 회원정보 출력
select * from memberlist where name like '홍%';


-- memberlist 테이블에서 1983년도 이후로 태어난 회원의 모든 회원정보
select * from memberlist where birth >= '1983-01-01';


-- booklist에서 제작년도가 2016년 이전이거나 입고가격(inprice)이 18000 이하인 도서의 모든 필드
select * from booklist where makeyear < 2016 or inprice <= 18000;


-- booklist에서 도서 제목에 두번째 글자가 '것'인 도서 정보
select * from booklist where subject like '_것%';



select * from emp;
select * from dept;












