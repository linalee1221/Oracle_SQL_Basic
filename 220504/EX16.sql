-- �������� : ������, �ε��� �ǽ�
-- 1) ��� ���̺��� �����ȣ�� �ڵ����� �����ǵ��� ������ �����ϱ�
-- ������ �̸� : SQ_EMP, ���۹�ȣ : 1, ���� : 1, �ִ밪 : 100000
CREATE SEQUENCE SQ_EMP START WITH 1 INCREMENT BY 1 MAXVALUE 100000;

-- 2) �����ȣ�� �������κ��� �߱�
-- �ӽ� ��� ���̺� : EMP01, �÷��� : EMPNO NUMBER(4) PRIMARY KEY
--                                                  ENAME VARCHAR2(10),
--                                                  HIREDATE DATE
-- INSERT ���� �̿��ؼ� EMPNO�� ������ ���� �߰��ϱ�(��, �̸��̳� ��¥�� ���� ����)
CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10),
HIREDATE DATE
);
INSERT INTO EMP01
VALUES(SQ_EMP.NEXTVAL, 'JULIA', SYSDATE);

SELECT * FROM EMP01;

-- 3) EMP01 ���̺� �̸�(ENAME) �÷��� INDEX ����(�ε����� : IDX_EMP01_ENAME)
CREATE INDEX IDX_EMP01_ENAME ON EMP01(ENAME);