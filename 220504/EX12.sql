-- 뷰(VIEW) 실습
-- 뷰(VIEW) : 가상 테이블(테이블은 공간이 할당되어 디스크에 저장되나 가상테이블은 따로 저장이 되지 않음)
-- 뷰에 저장된 것 : SQL문(SELECT문)
-- 예)
-- VIEW 생성 권한 주기(SYS, SYSTEM(관리자) 계정만 가능) : CMD창에서 다음과 같은 명령어 작성 
-- grant create any view to scott; GRANT 권한 TO 계정;
-- VIEW 생성 권한 뺏기(SYS, SYSTEM(관리자) 계정만 가능) : CMD창에서 다음과 같은 명령어 작성 
-- revoke create any view from scott; REVOKE 권한 FROM 계정;
CREATE OR REPLACE VIEW VW_EMP_JOB AS
SELECT ENO, ENAME, DNO, JOB
FROM EMPLOYEE
WHERE JOB LIKE 'SALES%';

SELECT * FROM VW_EMP_JOB;


-- 사원 테이블에는 급여정보가 포함되어 있음, 대외비(ex.급여) 테이블을 개발자에게 공개하고 싶지 않을 때
CREATE VIEW V_EMP_SAMPLE AS
SELECT ENO, ENAME, JOB, MANAGER, DNO
FROM EMPLOYEE;

-- 참고사항) 접속한 유저에 뷰 목록을 보고 싶을때 조회하는 딕셔너리
SELECT VIEW_NAME, TEXT FROM USER_VIEWS;

-- 그룹함수를 쓴 SELECT 문을 뷰(VIEW)로 만들기
CREATE OR REPLACE VIEW VW_EMP_SALARY AS
SELECT DNO, SUM(SALARY) AS "급여총액", TRUNC(AVG(SALARY)) AS "평균급여"
FROM EMPLOYEE GROUP BY DNO; -- 에러발생(SELECT문 그룹함수가 있는 컬럼에 별칭을 지정해야 함)

-- 뷰 삭제하기
-- 총 뷰가 몇개인지 확인하기
SELECT * FROM USER_VIEWS;

-- 삭제하기
DROP VIEW VW_EMP_JOB;
DROP VIEW V_EMP_SAMPLE;
DROP VIEW VW_EMP_SALARY;

