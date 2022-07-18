-- 연습문제 : 시퀀스, 인덱스 실습
-- 1) 사원 테이블의 사원번호가 자동으로 생성되도록 시퀀스 생성하기
-- 시퀀스 이름 : SQ_EMP, 시작번호 : 1, 증가 : 1, 최대값 : 100000
CREATE SEQUENCE SQ_EMP START WITH 1 INCREMENT BY 1 MAXVALUE 100000;

-- 2) 사원번호를 시퀀스로부터 발급
-- 임시 사원 테이블 : EMP01, 컬럼명 : EMPNO NUMBER(4) PRIMARY KEY
--                                                  ENAME VARCHAR2(10),
--                                                  HIREDATE DATE
-- INSERT 문을 이용해서 EMPNO에 시퀀스 값을 추가하기(단, 이름이나 날짜는 임의 생성)
CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10),
HIREDATE DATE
);
INSERT INTO EMP01
VALUES(SQ_EMP.NEXTVAL, 'JULIA', SYSDATE);

SELECT * FROM EMP01;

-- 3) EMP01 테이블 이름(ENAME) 컬럼에 INDEX 생성(인덱스명 : IDX_EMP01_ENAME)
CREATE INDEX IDX_EMP01_ENAME ON EMP01(ENAME);