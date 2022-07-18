-- 서브쿼리(자식쿼리) (중요!!)
-- =서브쿼리 : 데이터 1건만 비교
-- SELECT 안에 또 다른 SELECT가 포함된 형태
-- 문법) SELECT 컬럼리스트 FROM 테이블명 WHERE 컬럼명 = (SELECT문);
-- 예) SCOTT과 동일한 부서에서 근무하는 사원 출력

SELECT ENAME, DNO FROM EMPLOYEE WHERE DNO = (SELECT DNO FROM EMPLOYEE WHERE ENAME = 'SCOTT');


-- 메인쿼리에 HAVING절 사용하기
SELECT DNO, MIN(SALARY) AS 최소급여
FROM EMPLOYEE GROUP BY DNO
HAVING MIN(SALARY) > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DNO = 30);


-- 여러 건 서브쿼리(SUBQUERY)
-- IN / EXIST 연산자 비교
-- 성능 : EXIST가 검색 속도면에서 훨씬 좋음
-- IN : 메인쿼리의 비교 조건이 서브 쿼리의 결과중에서 하나라도 일치하면 참
-- 조회순서 : 서브쿼리 먼저 실행 -> 메인쿼리 실행하면서 조건 비교
-- EXIST : 메인쿼리의 비교 조건이 서브쿼리의 결과중에서 만족하는 값이 하나라도 존재하면 참
-- 조회순서 : 메인쿼리 먼저 실행 -> 서브쿼리의 조건을 비교하다가 만족하면 BREAK로 빠져나옴

-- 다중 행 서브쿼리
-- 예)
-- 서브쿼리를 조회해봤을 때 1건 나오면 =를 쓰고 1건 이상 나오면 ()로 묶어준다
SELECT ENO, ENAME FROM EMPLOYEE WHERE SALARY IN
(SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);

-- EXISTS 사용예) IN보다  조회 속도가 빠름
SELECT ENO, ENAME FROM EMPLOYEE A
WHERE EXISTS(SELECT 1 FROM EMPLOYEE GROUP BY DNO HAVING A.SALARY = MIN(SALARY));
