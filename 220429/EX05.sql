-- 오라클 내장함수
-- 1) UPPER(문자열) / LOWER(문자열) / INITCAP(문자열)
SELECT 'Oracle Mania',
        UPPER('Oracle Mania') AS 대문자,
        LOWER('Oracle Mania') AS 소문자,
        INITCAP('Oracle Mania') AS "첫 글자만 대문자"
FROM DUAL;

-- 직원 테이블
SELECT ENAME, LOWER(ENAME), JOB, INITCAP(JOB) FROM EMPLOYEE;

-- SCOTT 사원 검색하기
-- 컬럼의 데이터를 일괄 소문자로 변경해서 비교 가능하나 성능이 좋지 않다.
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE LOWER(ENAME) = 'scott';

-- 2) 문자길이를 반환하는 함수
SELECT LENGTH('OracleMania'), LENGTH('오라클매니아') FROM DUAL;

-- 3) 문자 조작 함수
-- CONCAT : 문자의 값을 연결하는 함수
-- 참고) 문자열 || 문자열 : 문자열 붙이기 가능
SELECT 'Oracle', 'mania', CONCAT('Oracle', 'mania'), 'Oracle' || 'mania' FROM DUAL;

-- 4) 문자 조작 함수
-- 문자열 자르기
-- SUBSTR(대상컬럼(문자), 시작위치, 개수)
SELECT SUBSTR('Oracle mania', 4, 3) FROM DUAL;

-- 문제12) 이름이 N으로 끝나는 사원 출력
-- 대상테이블 : EMPLOYEE
SELECT ENAME FROM EMPLOYEE WHERE SUBSTR(ENAME, -1, 1) = 'N';

-- 문제13) 87년도에 입사한 사원 출력
SELECT * FROM EMPLOYEE WHERE SUBSTR(HIREDATE, 1, 2) = '87';

-- SUBSTRB(대상컬럼(문자), 시작위치, 개수) : 문자 BYTE 기준으로 잘라서 출력
-- 영문(1BYTE) : SUBSTR / SUBSTRB 결과가 동일
-- 한글(3BYTE) : SUBSTR / SUBSTRB 결과가 틀림

-- 5) 문자열에서 대상 문자를 찾아 인덱스 번호를 반환
-- 오라클에서는 인덱스번호가 1부터 시작함
-- INSTR(대성컬럼(문자), 찾을 글자, 시작 위치, 몇번째 발견)
SELECT INSTR('Oracle mania', 'a') FROM DUAL;

-- 대상 문자열 중 'A'의 위치를 찾되 문자열의 5번째 위치에서 시작해서 찾고
-- 두번째 'A'를 찾았을 때의 인덱스 번호를 반환함
SELECT INSTR('Oracle mania', 'a', 5, 2) FROM DUAL;

-- 문제14) 사원 정보에서 INSTR을 사용하여 이름 세번째 자리가 R인 사원을 검색하는 쿼리문 작성
SELECT * FROM EMPLOYEE WHERE INSTR(ENAME, 'R', 3, 1) = 3;
-- 잘 사용하지 않음. WHERE 절에 내장함수를 붙이면 성능이 안 좋아지기 때문.