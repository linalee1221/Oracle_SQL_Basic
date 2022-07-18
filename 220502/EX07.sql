
-- 조인 ***** 중요!!
-- 사원테이블에 사원번호가 7788인 직원의 부서명은?
SELECT DNO
FROM EMPLOYEE
WHERE ENO = 7788;

SELECT DNAME
FROM DEPARTMENT
WHERE DNO = 20;

-- 일반 JOIN(EQUAL JOIN, INNER JOIN) : 교집합
SELECT A.DNO, A.DNAME, A.LOC FROM DEPARTMENT A, EMPLOYEE B
WHERE B.DNO = A.DNO
AND B.ENO = 7788

