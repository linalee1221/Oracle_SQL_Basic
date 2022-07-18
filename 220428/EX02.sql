-- DESC 테이블명
-- 테이블의 구조를 보여주는 명령어
-- NUMBER : 정수, 실수를 표기하는 자료형
-- NUMBER(4) : 4는 숫자 4자리
-- NUMBER(7,2) : 7은 정수 자리 수 7자리, 2는 소수 자리 수 2자리
-- VARCHAR2 : 문자열을 표기하는 자료형
-- UTF8 설정 : 영어 1Byte, 한글 3Byte
-- KSC5601 : 영어 1Byte, 한글 2Byte
-- VARCHAR2(10) : 10=자리수를 의미함
-- DATE : 날짜를 표기하는 자료형
DESC EMPLOYEE;

-- SELECT 절에 컬럼*12 사칙연산이 가능
SELECT ENAME, SALARY, SALARY*12 FROM EMPLOYEE;

-- SELECT 절에 컬럼 + 다른컬럼 => 계산이 가능
-- 컬럼 + 다른컬럼(NULL값이 있으면) = 최종 결과가 NULL이 됨
-- SALARY : 월급
-- SALARY*12 : 연봉

-- SALARY*12 + COMMISSION(보너스) : 최종 1년치 연봉이 계산됨
SELECT ENAME, SALARY, JOB, DNO, COMMISSION,
           SALARY*12, SALARY*12+COMMISSION
FROM EMPLOYEE;

-- 문제점) 상기 값에 NULL이 있어서 제대로 최종 1년치 연봉이 나오지 않음
-- 해결) NULL 컬럼을 0으로 변환하여 연봉이 제대로 연산되게 함 [NVL(컬럼명, 변경값) 내장함수 적용]
-- SELECT절에 AS를 사용하여 컬럼명 별칭 정할 수 있는데 AS 뒤에 변경할 컬럼명을 씀
SELECT ENAME, SALARY, JOB, DNO, NVL(COMMISSION,0),
           SALARY*12 AS 연봉, SALARY*12+NVL(COMMISSION,0) AS 최종연봉
FROM EMPLOYEE;


-- 컬럼명 별칭 주기
SELECT ENAME, SALARY, JOB, DNO, NVL(COMMISSION,0),
           SALARY*12 AS "연  ★  봉", SALARY*12+NVL(COMMISSION,0) AS 최종연봉
FROM EMPLOYEE;
        
-- DISTINCT : 컬럼에 중복된 내용 제거하고 보기(테이블 데이터에는 영향이 없음)
SELECT DISTINCT DNO AS 부서번호 FROM EMPLOYEE;

-- 테스트용, 간이 계산용 내장테이블
-- 테이블명 : DUAL

DESC DUAL;

SELECT 10*4/3 FROM DUAL;

-- 현재시간, 날짜 출력하는 내장함수
SELECT SYSDATE FROM DEPARTMENT;

-- 한 건만 표기하고 싶으면 데이터가 하나인 간이 테이블을 선택함(여기서는 DUAL)
-- DISTINCT를 걸어도 되나 속도가 저하됨
SELECT SYSDATE FROM DUAL;

-- 조건 : 범위 검색
-- SALARY가 1500 이상인 데이터를 추출
-- = : 같다, > : 보다 크다, < : 보다 작다 <> : 같지 않다
SELECT * FROM EMPLOYEE WHERE SALARY >=1500;

-- 문제1) 직원(EMPLOYEE)테이블에서 부서번호가 20보다 큰 데이터를 출력
SELECT * FROM EMPLOYEE WHERE DNO >=20;

-- 문자열 검색 : 홑따옴표(' ')
SELECT * FROM EMPLOYEE WHERE ENAME = 'SCOTT';

-- 날짜 데이터 검색
SELECT * FROM EMPLOYEE WHERE HIREDATE <='1981/01/01';

-- 날짜 포맷을 변경해서 문자열로 출력하는 내장함수
-- TO_CHAR(컬럼명, 변경할 포맷 방식) : 날짜, 날짜컬럼 => 문자열로 변경(지정된 포맷)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- 문자열을 날짜 데이터 형식으로 변경하는 내장함수
SELECT TO_DATE('2022-04-29 17:10:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- 논리연산자 : AND(둘 다 참이면 참), OR(둘 중에 하나가 참이면 참), NOT(반대)

-- 문제2) 부서번호가 10이고 직급이 'MANAGER'인 데이터만 출력하기
-- DNO : 부서번호 / JOB : 직급

SELECT * FROM EMPLOYEE WHERE DNO =10 AND JOB ='MANAGER';

-- 문제3) 부서번호가 10이거나 직급이 'MANAGER'인 데이터만 출력하기

SELECT * FROM EMPLOYEE WHERE DNO =10 OR JOB = 'MANAGER';

-- 문제4) 10번 부서에 소속된 사원만 제외하고 나머지 사원의 정보를 출력
SELECT * FROM EMPLOYEE WHERE DNO <>10;

-- 문제5) 급여가 1000에서 1500 사이의 데이터를 출력
SELECT * FROM EMPLOYEE WHERE SALARY >=1000 AND SALARY <=1500;

-- 문제6) 급여가 1000 미만이거나 1500 초과인 데이터를 출력
SELECT * FROM EMPLOYEE WHERE SALARY <1000 OR SALARY >1500;

-- 문제7) 커미션이 300이거나 500이거나 1400인 데이터를 출력
SELECT * FROM EMPLOYEE WHERE COMMISSION =300 OR COMMISSION =500 OR COMMISSION =1400;

-- 범위 검색 2
SELECT * FROM EMPLOYEE WHERE SALARY >=1000 AND SALARY <=1500;

-- WHERE 절 컬럼명 BETWEEN 초기값 AND 끝값
-- 초기값 ~ 끝값 사이의 값을 출력함
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 1000 AND 1500;

-- 사이 값 구하기
SELECT * FROM EMPLOYEE WHERE SALARY <1000 OR SALARY >1500;
-- 초기값보다 작거나 끝값보다 큰값
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 1000 AND 1500;

-- 문제8) 1982년에 입사한 출력하기
-- BETWEEN AND를 써서 출력하기
SELECT * FROM EMPLOYEE WHERE HIREDATE BETWEEN '1982-01-01' AND '1982-12-31';

-- COMMISSION이 300이거나 500이거나 1400인 데이터를 출력
SELECT * FROM EMPLOYEE WHERE COMMISSION =300 OR COMMISSION =500 OR COMMISSION =1400;
-- 위와 동일한 결과를 보여주는 문법
SELECT * FROM EMPLOYEE WHERE COMMISSION IN (300, 500, 1400);

-- COMMISSION이 300이 아니고 500도 아니고 1400도 아닌 데이터 출력
SELECT * FROM EMPLOYEE WHERE COMMISSION <> 300 AND COMMISSION <> 500 AND COMMISSION <> 1400;
-- 위와 동일한 결과를 보여주는 문법
SELECT * FROM EMPLOYEE WHERE COMMISSION NOT IN (300,500,1400);

