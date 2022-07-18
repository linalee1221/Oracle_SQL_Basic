-- 연습문제 : 제약조건(Constraint) 실습
-- 1) EMPLOYEE 테이블의 구조를 복사하여 EMP_SAMPLE 테이블 생성
--    사원 테이블의 사원번호 컬럼에 테이블 레벨로 PRIMARY KEY 제약조건을 지정하되,
--    제약조건 이름은 PK_MY_EMP로 지정

CREATE TABLE EMP_SAMPLE AS
SELECT * FROM EMPLOYEE
WHERE 1=0; -- 테이블 구조만 가져올거기 때문에 거짓조건을 만들어준다
-- 기본키 생성
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT PK_MY_EMP PRIMARY KEY(ENO);

-- 2) DEPARTMENT 테이블의 구조를 복사하여 DEPT_SAMPLE 테이블 생성
--    부서번호 컬럼(DNO)에 PRIMARY KEY 제약조건을 지정하되,
--    제약조건 이름은 PK_MY_DEPT로 지정

CREATE TABLE DEPT_SAMPLE AS
SELECT * FROM DEPARTMENT
WHERE 1=0;

ALTER TABLE DEPT_SAMPLE
ADD CONSTRAINT PK_MY_DEPT PRIMARY KEY(DNO);


-- 3) 사원 테이블의 부서번호 컬럼에 존재하지 않는 부서의 사원이 배정되지 않도록
--    외래 키(FOREIGN KEY:FK) 제약조건을 지정하되, FK_MY_DEPT_EMP로 지정
-- 참조키, 외래키
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT FK_MY_DEPT_EMP
FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO);

