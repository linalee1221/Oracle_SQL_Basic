-- LIKE 용법 심층해서 검토
-- 1) WHERE 컬럼명 LIKE '문자%'
-- 특정 문자가 있는 데이터는 모두 뽑기
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'F%';

-- 2) WHERE 컬럼명 LIKE '%문자%'
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%M%';

-- 문제9) 사원 테이블에서 이름이 N으로 끝나는 데이터 출력
-- 이름 컬럼명 : ENAME

SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%N';

-- % : 문자가 없거나 하나 이상의 문자가 어떤 값이 와도 상관 없음
-- _ : 하나의 문자가 어떤 값이 와도 상관이 없다
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '_A%';

-- 이름의 세번째 글자가 A인 데이터 출력
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '__A%';

-- 이름에 A가 안들어가는 데이터 출력
SELECT * FROM EMPLOYEE WHERE ENAME NOT LIKE '%A%';

-- NULL : 아무 값도, 공간도 없는 것
-- NULL과 연산을 하면 NULL이 됨
-- IS NULL : NULL인 데이터만 출력
SELECT * FROM EMPLOYEE WHERE COMMISSION IS NULL;

-- IS NOT NULL : NULL이 아닌 데이터만 출력
SELECT * FROM EMPLOYEE WHERE COMMISSION IS NOT NULL;

-- 문제10) COMMISSION이 NULL인 값 중에서 SALARY가 1000보다 큰 데이터 출력
SELECT * FROM EMPLOYEE WHERE COMMISSION IS NULL AND SALARY >=1000;

-- 문제11) 직원 테이블에서 날짜 정보를 내림차순으로 정렬하여 출력
SELECT * FROM EMPLOYEE ORDER BY HIREDATE DESC;

-- 문제12) 동일한 급여를 받는 사원에 대해서 이름의 순서가 빠른 사람부터 출력
SELECT * FROM EMPLOYEE ORDER BY SALARY, ENAME;





