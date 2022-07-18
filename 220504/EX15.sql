-- INDEX 실습

-- 주로 조회가 많은 대상 컬럼에 생성
-- 인덱스 목적 : 조회(SELECT) 성능을 높이기 위해 생성함
-- 인덱스 알고리즘 : B* TREE (검색 속도 향상 알고리즘)
-- 문법 : CREATE INDEX 인덱스이름 ON 테이블명(컬럼명);
-- 인덱스를 걸어야 하는 컬럼
-- 1) 테이블에 행의 수가 너무 많을 때 : 10만건 이상
-- 2) WHERE 절에 대상 컬럼이 너무 자주 나올 때
-- 3) 검색 결과 전체의 대략 2% ~ 5% 정도 나올 때 (반대로 10% 이상일 때 인덱스 걸면 더 안 좋다)
-- 4) 조인에 사용되는 컬럼은 인덱스를 거는 것을 고려
-- 예) 
CREATE INDEX IDX_EMPLOYEE_ENAME
ON EMPLOYEE(ENAME);

-- 인덱스 생성 확인(인덱스 전용 딕셔너리)
SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- 인덱스 삭제
DROP INDEX IDX_EMPLOYEE_ENAME;

-- 특수 )결합 인덱스 : 두개 이상의 컬럼으로 구성하는 인덱스
CREATE INDEX IDX_DEPT_COM
ON DEPARTMENT(DNAME, LOC);

-- 특수) 함수 인덱스 : 수식이나 함수를 적용해서 만든 인덱스
CREATE INDEX IDX_EMP_ANNSAL
ON EMPLOYEE(SALARY*12);
