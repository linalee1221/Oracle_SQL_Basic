-- 검색(R)
-- * : ALL COLUMN ( DEPTNO, DNAME, LOC )
-- select * from DEPT;
-- SELECT 컬럼명 FROM 테이블명 WHERE 조건컬럼 = '' 또는 LIKE '%';
-- ORDER BY 정렬대상컬럼[복수가능] ASC/DESC;
select DEPTNO, DNAME, LOC from DEPT;
-- 한 컬럼(DEPTNO)만 보기
select DEPTNO from DEPT;
-- 다른 컬럼들도 하나씩 보기
SELECT DNAME FROM DEPT;
SELECT LOC FROM DEPT;

-- 조건에 맞는 데이터 가져오기
-- WHERE [조건절] : 조건 문법
-- DEPT 테이블에서 DNAME(부서이름)이 SALES인 데이터를 가져오는 문법
SELECT DNAME FROM DEPT WHERE DNAME = 'SALES';
-- DEPT 테이블에 DEPTNO가 10인 데이터를 가져오기
SELECT DEPTNO FROM DEPT WHERE DEPTNO = 10;

-- WHERE [조건컬럼] LIKE 'S%'
-- 조건 컬럼에 S로 시작되는 문자열 모두 가져오기
SELECT * FROM EMP WHERE ENAME LIKE 'S%';
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S%';

-- EMP 테이블에서 JOB에 M으로 시작되는 문자열을 가진 데이터를 모두 가져오기
-- SELECT 자리에 들어가는 컬럼의 위치에 따라 데이터 출력 순서가 바뀐다
SELECT ENAME, JOB FROM EMP WHERE JOB LIKE 'M%';

-- 내장함수 UPPER(문자열)/LOWER(문자열) : 대/소문자 바꾸기
-- DB 테이블 데이터는 대소문자를 별개의 문자열로 인식함
SELECT ENAME, JOB FROM EMP WHERE JOB = UPPER('manager');

-- 정렬 : 오름차순
-- SELECT문 맨 끝에 ORDER BY [컬럼명] ASC;
-- DNAME(부서명)을 오름차순으로 정렬하기
SELECT * FROM DEPT ORDER BY DNAME ASC;

-- 정렬 : 내림차순
-- SELECT문 맨 끝에 ORDER BY [컬럼명] DESC;
-- DNAME(부서명)을 내림차순으로 정렬하기
SELECT * FROM DEPT ORDER BY DNAME DESC;

-- EMP 테이블에서 JOB이 'MANAGER'인 데이터를 오름차순으로 정렬하기
SELECT * FROM EMP WHERE JOB = 'MANAGER' ORDER BY ENAME ASC;

-- EMP 테이블에서 JOB이 'CLERK'인 데이터를 내림차순으로 정렬하기
SELECT * FROM EMP WHERE JOB = 'CLERK' ORDER BY ENAME DESC;

-- 도전 과제
-- EMP 테이블에서 JOB이 'CLERK'인 데이터를 뽑아서
-- ENAME(직원이름), EMPNO(직원번호)로 내림차순 정렬하기
-- 복수정렬은 각각의 컬럼에 대해 DESC/ASC 걸어줘야 함
SELECT * FROM EMP WHERE JOB = 'CLERK' ORDER BY ENAME DESC, EMPNO DESC;
-- 오름차순 ASC는 생략가능
-- ORDER BY 2, 1; 컬럼 아이디로도 정렬 가능






