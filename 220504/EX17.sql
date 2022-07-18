-- 유저만들기 실습
-- SCOTT 유저 권한 상승(현재 접속되어 있는 계정) : 롤(ROLE : 여러 권한들을 모두 모아둠)
-- CONNECT(접속에 관련된 권한 모음)
-- RESOURCE(테이블, 뷰, 프로시저 생성 권한)
-- DBA(유저, DB관리 등, 최상위 권한)
-- SCOTT 유저 권한 상승시키기 : GRANT CONNECT, RESOURCE, DBA TO SCOTT;
--                                           GRANT CREATE USER TO SCOTT;

-- 유저 생성
-- 오라클 공간관리 영역 : TABLESPACE
CREATE USER GUEST01 IDENTIFIED BY 1111
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;

-- 권한 종류
-- CREATE TABLE : 테이블 생성 권한
-- CREATE VIEW : 뷰 생성 권한
-- CREATE SEQUENCE : 시퀀스 생성 권한

-- 권한부여 명령어
-- GRANT 권한[롤] TO 유저명

-- 권한취소 명령어
-- REVOKE 권한[롤] FROM 유저명

-- 동의어 : 테이블 : SELECT * FROM SCOTT3.EMPLOYEE 별칭으로 변경해서 이름을 정의해줄 수 있다

-- 연습문제
-- 1) KBS 사용자 생성 / 암호 1234
-- DEFAULT TABLESPACE 명은 USERS를 사용
-- TEMPORARY TABLESPACE 명은 TEMP를 사용
CREATE USER KBS IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;

-- 2) 1번에서 생성한 유저에 CONNECT, RESOURCE 권한[롤]을 부여
