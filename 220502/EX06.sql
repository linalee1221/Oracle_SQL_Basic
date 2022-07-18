
-- 왼쪽 자리를 특정 기호로 채우는 내장함수
-- LPAD(컬럼명, 자리수, 채울 문자)
SELECT LPAD(SALARY, 10, '*') FROM EMPLOYEE;

-- 오른쪽 자리를 특정 기호로 채우는 내장함수
-- RPAD(컬럼명, 자리수, 채울 문자)
SELECT RPAD(SALARY, 10, '*') FROM EMPLOYEE;

-- LTRIM(문자열) : 왼쪽 공백 제거
-- RTRIM(문자열) : 오른쪽 공백 제거
-- TRIM(문자열) : 양쪽 공백 제거
SELECT ' Oracle mania ', LTRIM(' Oracle mania '), RTRIM(' Oracle mania '), TRIM(' Oracle mania ') FROM DUAL;

-- 숫자 함수
-- ROUND(실수, 반올림 할 자리 수(생략가능) : 특정 자리수에서 반올림 하는 내장함수
SELECT 98.7654, 
ROUND(98.7654), -- 첫째자리 반올림
ROUND(98.7654, 2), -- 둘째자리 반올림(매개변수에 둘째자리 지정)
ROUND(98.7654, -1) -- 정수 1자리 반올림
FROM DUAL;

-- TRUNC : 특정 자릿수에서 버림
SELECT 98.7654,
TRUNC(98.7654), -- 첫째자리에서 버림
TRUNC(98.7654, 2), -- 둘째자리에서 버림
TRUNC(98.7654, -1) -- 정수 1자리 버림
FROM DUAL;

-- MOD : 첫번째 값을 두번째 값으로 나눈 나머지를 반환
SELECT 
MOD(31, 2),
MOD(31, 5),
MOD(31,8)
FROM DUAL;

-- 문제1) 모든 사원의 급여를 500으로 나눈 나머지를 계산 후 출력

SELECT ENAME, SALARY, MOD(SALARY,500) FROM EMPLOYEE;

-- 날짜 함수
-- 시스템에 저장된 현재 날짜를 반환하는 변수
SELECT SYSDATE FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS 일시 FROM DUAL;

-- 날짜 연산
SELECT 
SYSDATE -1 AS 어제, -- 어제
SYSDATE AS 오늘, -- 오늘
SYSDATE +1 AS 내일 -- 내일
FROM DUAL;

-- 도전과제) 사원들의 현재까지의 근무일수 구하기
-- 직원테이블 : EMPLOYEE
-- 입사일 : HIREDATE

SELECT ENAME, ROUND(SYSDATE - HIREDATE) AS 근무일수 FROM EMPLOYEE;

-- 날짜와 날짜 사이의 개월 수를 구하는 내장함수
-- MONTHS_BETWEEN(현재날짜, 과거날짜)
-- 근무일수를 개월수로 출력한 내용
SELECT ENAME, SYSDATE, HIREDATE, 
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS 개월수
FROM EMPLOYEE;

-- 입사한지 6개월 지난 날짜를 구하는 구문
-- ADD_MONTHS(날짜컬럼, 더할 개월수) : 날짜컬럼 + 6개월
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) AS "6개월 후"
FROM EMPLOYEE;

-- 오늘을 기준으로 최초로 도래하는 토요일 구하기
-- NEXT_DAY(날짜, 요일)
SELECT SYSDATE, 
NEXT_DAY(SYSDATE, '토요일') AS "이번주 토요일",
NEXT_DAY(SYSDATE, 7) AS "숫자로 이번주 토요일"
FROM DUAL;

-- 입사한 달의 마지막 날 구하기
SELECT ENAME, HIREDATE,
LAST_DAY(HIREDATE)
FROM EMPLOYEE;

-- 자료형 변환 함수
-- TO_CHAR : 날짜형 또는 숫자형을 문자형으로 변환하는 내장함수
-- TO_CHAR(날짜컬럼, 지정포맷) : 날짜를 지정된 포맷을 가진 문자열로 변환
SELECT ENAME, HIREDATE,
TO_CHAR(HIREDATE, 'YY/MM') AS "입사연월",
TO_CHAR(HIREDATE, 'YYYY/MM/DD DAY') AS "입사연월일/요일",
TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') AS "자주 쓰는 포맷"
FROM EMPLOYEE;
 
-- TO_CHAR : 숫자를 지정된 포맷을 가진 문자열로 변환
-- 9 : 자릿수를 나타냄, 자릿수가 맞지 않으면 공간을 채우지 않음
-- 0 : 자릿수를 내타냄, 자릿수가 맞지 않으면 0으로 채움
-- L : 각 지역별 통화 기호를 앞에 표시함
-- , : 천 단위 자리 구분을 위해 표시
SELECT ENAME, SALARY,
TO_CHAR(SALARY, 'L999,999') AS "돈 표시",
TO_CHAR(SALARY, 'L000,000') AS "돈 표시2"
FROM EMPLOYEE;

--  TO_DATE : 문자를 날짜로 변환하는 내장 함수
-- 도전과제) 1981년 2월 20일에 입사한 사원 검색하기
-- 사원 테이블 : EMPLOYEE
-- 입사일 컬럼 : HIREDATE
SELECT ENAME, HIREDATE 
FROM EMPLOYEE WHERE HIREDATE=TO_DATE('19810220', 'YYYYMMDD');

-- 문자를 숫자로 바꾸는 내장함수
-- TO_NUMBER (문자열 숫자, 지정포맷) : 문자열을 지정된 포맷의 숫자로 바꾸기
SELECT TO_NUMBER('100,000', '999,999') - TO_NUMBER('50,000','999,999')
FROM DUAL;

-- 문제1) SUBSTR 함수를 사용하여 사원들의 입사연도와 입사월만 출력
-- 힌트 출력형태 : SELECT 연도, 월 FROM EMPLOYEE 
SELECT ENAME, HIREDATE,  
SUBSTR(HIREDATE, 1, 2) AS 입사연도, 
SUBSTR(HIREDATE, 4, 2) AS 입사월 
FROM EMPLOYEE;

-- 문제2) SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력
SELECT * FROM EMPLOYEE WHERE SUBSTR(HIREDATE, 4, 2)='04';

-- 문제3) MOD함수를 사용하여 사번이 짝수인 사원 출력
SELECT * FROM EMPLOYEE WHERE MOD(ENO, 2) = 0;

-- 문제4) 올해 며칠이 지났는지 출력(현재날짜에서 올해 1월 1일을 뺀 결과 출력)
-- 단, TO_DATE 함수를 사용해서 형을 일치시켜 계산
SELECT TRUNC(SYSDATE - TO_DATE('20220101', 'YYYYMMDD')) FROM DUAL;

-- 일반 함수
-- NVL(NULL이 포함된 컬럼, 바꿀 값) : NULL이면 0 또는 다른 값으로 바꾸는 내장 함수
SELECT ENAME, SALARY, COMMISSION, 
NVL(COMMISSION,0) AS "보너스", 
SALARY * 12 + NVL(COMMISSION,0) AS "연봉"
FROM EMPLOYEE ORDER BY JOB;

-- NVL2(컬럼값, 표현식1, 표현식2)
-- 컬럼값이 NULL이면 표현식2를 반환하고, NULL이 아니면 표현식1을 반환
SELECT ENAME, SALARY, COMMISSION, 
NVL2(COMMISSION, SALARY*12 + COMMISSION, SALARY*12)
FROM EMPLOYEE ORDER BY JOB;

-- NULLIF(표현식1, 표현식2)
-- 표션식 1 == 표현식2 이면 NULL을 출력, 아니면 표션식 1을 출력
SELECT NULLIF('A', 'A'), NULLIF('A', 'B') FROM DUAL;

-- 오라클에서 IF/ELSE 하는 방법
-- DECODE(표현식, 조건1, 결과2
--                        조건2, 결과2
--                        조건3, 결과3
--                        다 아니면 출력해 줄 기본 결과)
SELECT ENAME, DNO, DECODE(DNO, 10, '회계부', 20, '연구소', 30, '영업부', 40, '운영팀', 'DEFAULT') AS "부서이름"
FROM EMPLOYEE ORDER BY DNO;

-- 또다른 방식 IF / ELSE IF / ELSE 방식
SELECT ENAME, DNO, 
CASE WHEN DNO = 10 THEN '회계부'
         WHEN DNO = 20 THEN '연구소'
         WHEN DNO = 30 THEN '영업부'
         WHEN DNO = 40 THEN '운영팀'
                   ELSE 'DEFAULT'
END AS "부서이름"
FROM EMPLOYEE ORDER BY DNO;

-- 문제5) 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL값 대신
-- 0을 출력하시오
-- 사원테이블 : ELPLOYEE
-- 상관컬럼 : MANAGER
SELECT ENO, ENAME, NVL2(MANAGER, MANAGER,0) AS "사번" FROM EMPLOYEE;


-- 문제6) DECODE 혹은 CASE WHEN 함수로 직급에 따라 급여를 인상하도록 하시오
-- 직급이 'ANALYST'인 사원은 200, 'SALESMAN'인 사원은 180, 'MANAGER'인 사원은 150,
-- 'CLERK'인 사원은 100으로 인상
SELECT ENO, ENAME, JOB, SALARY,
DECODE(JOB, 'ANALYST', SALARY+200,
                    'SALESMAN', SALARY+180,
                    'MANAGER', SALARY+150,
                    'CLERK', SALARY+100,
                    SALARY) AS "인상 후"
FROM EMPLOYEE;

-- 그룹함수
-- SUM : 누적 합계를 반환
-- AVG : 그룹의 평균을 반환
-- COUNT : 그룹의 개수를 반환
-- MAX : 그룹의 최대값을 반환
-- MIN : 그룹의 최소값을 반환
SELECT 
SUM(SALARY) AS "급여 총액", 
TRUNC(AVG(SALARY)) AS "급여 평균",
MAX(SALARY) AS "최대 급여",
MIN(SALARY) AS "최소 급여"
FROM EMPLOYEE;

-- 문제7) 최근에 입사한 사원과 가장 오래전에 입사한 사원의 입사일 출력
-- 사원테이블 : EMPLOYEE
-- 입사일 : HIREDATE
SELECT MAX(HIREDATE) AS 최근, MIN(HIREDATE) AS 오래전 FROM EMPLOYEE;

-- 그룹함수 VS NULL : NULL은 내부적으로 제외하고 계산해줌
SELECT SUM(COMMISSION) AS "커미션 총액" FROM EMPLOYEE;

-- COUNT : 건수 세기
SELECT COUNT(*) FROM EMPLOYEE;

-- COMMISSION을 받는 사원의 수를 출력
-- 그룹함수는 NULL을 제외하기 때문에 커미션을 받는 사람 수를 구할 수 있다
SELECT COUNT(COMMISSION) FROM EMPLOYEE;
SELECT COUNT(COMMISSION) FROM EMPLOYEE WHERE COMMISSION IS NOT NULL;
-- 동일한 결과를 출력함

-- 활용 예)
SELECT COUNT(JOB) AS "직업의 개수" FROM EMPLOYEE;
-- 중복을 제거하고 싶을 때
SELECT COUNT(DISTINCT JOB) AS "중복 제거" FROM EMPLOYEE;

-- 그룹함수를 쓸 때 조심해야 할 것
-- 일반 컬럼과 같이 쓸 수 없음, 그룹함수끼리 써야 함
SELECT COUNT(ENO), MAX(SALARY) FROM EMPLOYEE;

DESC EMPLOYEE;

-- ** GROUP BY 절
-- 그룹함수 : 하나의 결과값을 보여줌(COUNT, MAX, SUM)
-- 예시) 부서별 평균 급여를 출력하고 싶을 때
-- GROUP BY 컬럼명 => SELECT 컬럼명 같아야함
SELECT DNO AS "부서번호", TRUNC(AVG(SALARY)) AS "평균 급여" FROM EMPLOYEE
GROUP BY DNO; -- 부서번호로 그룹화

-- O, X
-- 잘못된 쓰임 예시 : ENAME -> GROUP BY 절에 없는 컬럼.
SELECT DNO, AS "부서번호", ENAME, TRUNC(AVG(SALARY)) AS "평균 급여"
FROM EMPLOYEE GROUP BY DNO;

-- 도전과제) 부서별, 직급별 총급여를 계산하여 출력
-- 부서컬럼 : DNO, 직급컬럼 : JOB, 대상테이블 : EMPLOYEE
SELECT DNO AS "부서번호", JOB AS "직급", SUM(SALARY) AS "총 급여" FROM EMPLOYEE
GROUP BY DNO, JOB;

-- GROUPT BY 절에 조건걸기
-- 부서별로 최대 급여를 구하는데 총액이 3000 이상인 데이터만 출력
-- GROUPT BY 조건은 HAVING으로 건다.
SELECT DNO AS "부서번호", MAX(SALARY) AS "급여" FROM EMPLOYEE
GROUP BY DNO 
HAVING MAX(SALARY) >= 3000;

-- 도전과제) MANAGER를 제외하고 급여 총액이 5000이상인 직급별 급여 총액(SUM) 구하고
-- 급여총액을 기준으로 오름차순 정렬
-- 직원테이블 : EMPLOYEE, 직급컬럼 : JOB, 급여컬럼 : SALARY
SELECT JOB, SUM(SALARY) FROM EMPLOYEE WHERE JOB NOT LIKE '%MANAGER%'
GROUP BY JOB
HAVING SUM(SALARY) >= 5000
ORDER BY SUM(SALARY);

-- 문제1) 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여 출력
SELECT 
MAX(SALARY) AS "최고액",
MIN(SALARY) AS "최저액", 
SUM(SALARY) AS "급여총액", 
ROUND(AVG(SALARY)) AS "평균급여"
FROM EMPLOYEE;

-- 문제2) 각 담당업무 유형별로 급여 최고액, 최저액, 총액 및 평균액 출력
SELECT JOB AS "담당 업무",
MAX(SALARY) AS "최고액",
MIN(SALARY) AS "최저액",
SUM(SALARY) AS "급여총액",
ROUND(AVG(SALARY)) AS "평균급여"
FROM EMPLOYEE
GROUP BY JOB;

-- 문제3) COUNT(*) 함수를 이용하여 담당 업무가 동일한 사원 수 출력
-- 직원테이블 : EMPLOYEE
SELECT JOB, COUNT(*) FROM EMPLOYEE GROUP BY JOB;

-- 문제4) 관리자 수를 출력
SELECT COUNT(MANAGER) AS "관리자 수" FROM EMPLOYEE;

-- 문제5) 급여 최고액, 급여 최저액의 차액을 출력
-- 컬럼명 : "차액"
SELECT
MAX(SALARY) AS "최고액", 
MIN(SALARY) AS "최저액",
(MAX(SALARY)-MIN(SALARY)) AS "차액"
FROM EMPLOYEE;

-- 문제6) 직급별 사원의 최저급여 출력(단, 관리자를 알 수 없는 사원 및 최저 급여가 2000 미만인 그룹 제외)
-- 결과를 급여에 대한 내림차순으로 정렬
-- 그룹함수들은 자동으로 NULL을 빼고 계산
SELECT JOB, MIN(SALARY) FROM EMPLOYEE
WHERE MANAGER IS NOT NULL
GROUP BY JOB
HAVING NOT MIN(SALARY) < 2000
ORDER BY MIN(SALARY) DESC;

-- 문제7) 각 부서에 대해 부서번호, 사원수, 부서 내의 모든 사원의 평균 급여를 출력(부서별 사원수, 평균급여 출력)
-- 컬럼별칭 : 부서번호, 사원수, 평균급여
-- 평균급여는 소수점 둘째자리에서 반올림

SELECT DNO, 
COUNT(*) AS "사원수",
ROUND(AVG(SALARY), 2) AS "평균급여"
FROM EMPLOYEE
GROUP BY DNO;

-- 문제 8) 각 부서에 대해 부서이름, 지역명, 사원수
-- 부서별 사원의 평균 급여 출력(DECODE, CASE WHEN)
-- 컬럼별칭 : 부서이름, 지역명, 사원수, 평균급여
-- 부서이름 및 지역명은 DEPARTMENT의 DNAME, LOC 데이터 참고
-- 1) 1차 DECODE 빼고 구하기
-- 2) 2차 DECODE나 CASE WHEN을 적용하기
SELECT 
DECODE(DNO, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS') AS 부서이름,
DECODE(DNO, 10, 'NEW YORK', 20, 'DALLAS', 30, 'CHICAGO', 40, 'BOSTON') AS 지역명,
COUNT(*) AS "사원수",
TRUNC(AVG(SALARY)) AS "평균급여"
FROM EMPLOYEE
GROUP BY DNO;