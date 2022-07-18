--0503
--�١ڡ١ڡ� ����(JOIN) �١ڡ١ڡ�
--������̺� �����ȣ�� 7788�� ������ �μ�����?
SELECT DNO FROM EMPLOYEE
WHERE ENO = 7788;
DESC EMPLOYEE;

SELECT DNAME FROM DEPARTMENT
WHERE DNO = 20;
DESC DEPARTMENT;

--�Ϲ� JOIN(EQUAL JOIN, INNER JOIN) ������
SELECT A.DNO, A.DNAME, A.LOC, B.ENO, B.ENAME 
FROM DEPARTMENT A,
     EMPLOYEE B
WHERE B.DNO = A.DNO
AND B.ENO = 7788;

--������(Cartesian Product) : ī��þ� ��
-- DEPARTMENT �Ǽ� : 4�� X EMPLOYEE �Ǽ� : 14�� = 56�� 
--10�� * 100�� = 1000�� �����
SELECT COUNT(*)
FROM DEPARTMENT A,
     EMPLOYEE B;
     

--Equal Join(=Join)
--���δ�� ���̺��� ���� �÷��� = �񱳸� ���� ���� ���� ������ ���� �����Ͽ� ����� ����
--���� ��� �� : �׻� ���� �Ǽ� ���̺��� ���� ó���ǰ� ����°� ��
--���� :
--SELECT ���̺�1.�÷�, ���̺�2.�÷�
--FROM ���̺�1, ���̺�2
--WHERE ���̺�2.�÷�=���̺�1.�÷�

--����1) �� ������� �Ҽӵ� �μ� ���� ���
SELECT * 
FROM DEPARTMENT A,
     EMPLOYEE B
WHERE B.DNO = A.DNO;


--����2) �����ȣ�� 7499, 7900 ������� �Ҽӵ� �μ����� ��� ���
SELECT * 
FROM DEPARTMENT A,
     EMPLOYEE B
WHERE B.DNO = A.DNO --���� �÷��� ã�Ƽ� =(EQUAL)���� ��
AND B.ENO IN (7499, 7900);


--����3) �����ȣ�� 7600 ~ 7700 ���̿� �ִ� ������� �Ҽӵ� �μ����� ��� ����ϵ�, �μ� �̸��� SALES�� ��Ʈ�� ����ϼ���
SELECT A.DNO, A.DNAME, A.LOC, B.ENO, B.ENAME, B.JOB, B.MANAGER, B.HIREDATE, B.SALARY, B.COMMISSION 
FROM DEPARTMENT A,
     EMPLOYEE B
WHERE B.DNO = A.DNO
AND B.ENO BETWEEN 7500 AND 7700
AND DNAME = 'SALES';

--���̺� �ּ� �� �÷� �ּ� �ֱ�
--���̺��ּ�
COMMENT ON TABLE DEPARTMENT IS '�μ�����';
--�÷� �ּ�
COMMENT ON COLUMN DEPARTMENT.DNAME IS '�μ��̸�';
COMMENT ON COLUMN DEPARTMENT.DNO IS '�μ���ȣ';
COMMENT ON COLUMN DEPARTMENT.LOC IS '������';


COMMENT ON TABLE EMPLOYEE IS '��������';

COMMENT ON TABLE BONUS IS '���ʽ�';
COMMENT ON TABLE SALGRADE IS '�޿�����';


--NOT EQUAL JOIN  = ��������
--���(SLAGRADE) ���̺�
--1��� : 700~1200
--2��� : 1201~1400
--5��� : 3001~9999
--�޿� ����� �������� ����� �޿��� ���޿� ���ϴ��� �˾ƺ���
SELECT ENAME, SALARY, GRADE
FROM SALGRADE A,
    EMPLOYEE B
WHERE SALARY BETWEEN LOSAL AND HISAL;

--�߰� �μ����� �����ֱ�
SELECT ENAME, DNAME , SALARY, GRADE
FROM SALGRADE A,
    DEPARTMENT B,
    EMPLOYEE C
WHERE B.DNO = C.DNO
AND SALARY BETWEEN LOSAL AND HISAL;


--Ư�����2) SELF JION
--������̺� MANAGER �÷�(�� ����� �Ŵ��� ���)
SELECT MAN.ENO, MAN.ENAME, MAN.MANAGER, EMP.ENAME 
FROM EMPLOYEE EMP,
    EMPLOYEE MAN
WHERE EMP.ENO = MAN.MANAGER
AND MAN.ENAME LIKE 'SMITH%';

--Ư�����3) �١ڡ� OUTER JOIN
-- = ������ ���� �÷��� �����ؼ� �����͸� �����ִµ� NULL���� =������ �ȵǱ� ������ �����Ϳ��� ���ܵ�
--NULL���� �ش�Ǵ� �ٸ� �÷��� ������� �� ���� ����
SELECT EMP.ENAME AS ����,
       MAN.ENAME AS �Ŵ���
FROM EMPLOYEE EMP,
     EMPLOYEE MAN
WHERE EMP.MANAGER = MAN.ENO(+);


--DDL(Data Definition Language) : ������ ���Ǿ�
--���̺� �����, ���̺� �����ϱ�, �÷� �����ϱ�, �÷� �߰��ϱ�
--���̺� �����
--��) �μ� ������ �����ϱ� ���� ���̺� �����ϱ�
--���̺�� : TB_DEPARTMENT
CREATE TABLE TB_DEPARTMENT(
    DNO NUMBER(2),
    DNAME VARCHAR2(20),
    LOC VARCHAR2(20)
);

--���̺� �����ϱ�
DROP TABLE TB_DEPARTMENT2;


--���̺� �����ϱ�(���ó�� ���⵵ ��)
--�����ͱ��� ���� ��
CREATE TABLE TB_DEPARTMENT
AS
SELECT * 
FROM DEPARTMENT;

--������ ���� ������ ����
CREATE TABLE TB_DEPARTMENT2
AS
SELECT * 
FROM DEPARTMENT
WHERE 1=2; --�������� ��ȸ

--20�� �μ� �Ҽ� ����� ������ ������ DEPT20 ���̺� �����ϱ�

CREATE TABLE TB_DEPARTMENT
AS
SELECT * 
FROM DEPARTMENT
WHERE DNO = 20;

CREATE TABLE TB_EMPLOYEE
AS
SELECT * 
FROM EMPLOYEE
WHERE DNO = 20;

DROP TABLE TB_DEPARTMENT02;
DROP TABLE TB_EMPLOYEE;

--���̺� ������ �����ϴ� ��ɾ�
--ALTER TABLE ~ 
CREATE TABLE TB_DEPARTMENT
AS
SELECT *
FROM DEPARTMENT
WHERE 1=2;

-- TB_DEPARTMENT �÷� �߰�
ALTER TABLE TB_DEPARTMENT
ADD(BIRTH DATE);

--TB_DEPARTMENT ���̺� �÷� ����
--DNAME VARCHAR2(14) -> DNAME VARCHAR2(20)
ALTER TABLE TB_DEPARTMENT
MODIFY DNAME VARCHAR2(20);

--TB_DEPARTMENT ���̺� �÷� ����
--BIRTH �÷� ����
--�ѹ��� �ϳ��� ���� ����
ALTER TABLE TB_DEPARTMENT
DROP COLUMN BIRTH;

--���̺� �̸��� �����ϴ� ��ɾ�
--����) RENAME A TO B : A ���̺� ���� B�� �ٲٱ�
RENAME TB_DEPARTMENT02 TO TB_DEPARTMENT;

--���̺��� ��� �����͸� �����ϴ� ��ɾ�(������+�Ҵ�� ����)
CREATE TABLE TB_DEPARTMENT02
AS
SELECT *
FROM DEPARTMENT;
--������ ����
TRUNCATE TABLE TB_DEPARTMENT02;

--�߰��� ����Ŭ DB���� ����ϴ� ��Ÿ����(������ ���̺�, �÷� ����, �������� ��)�� �� �� �ִ� ���̺�
--USER_xxx : ���� �� ������ ���� �������� �������� ������(�÷�, ���̺� ��)
--ALL_XXX : ���� �� ���� + �ٸ� ������ ���� ������ ������(�÷�, ���̺� ��)
--DBA_XXX : ��� ������ ���� ������ ������(�÷�, ���̺� ��)
SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;


-- DML(Data Manipulation Language) : ������ ���۾�
--INSERT / UPDATE / DELETE

SELECT * FROM USER_TABLES;
DROP TABLE DEPT;

--�׽�Ʈ�� ���̺� �� ������ �����
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT;
SELECT * FROM DEPT_COPY;

--������ ����
TRUNCATE TABLE DEPT_COPY;

--������ �߰��ϱ�
INSERT INTO DEPT_COPY(DNO, LOC, DNAME)
VALUES(20, 'DALLAS', 'RESEARCH');
INSERT INTO DEPT_COPY
VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO DEPT_COPY
VALUES(40, 'OPERATIONS', 'BOSTON');--������� �ӽ� �ݿ�
COMMIT;

-- ������ �߰�
-- 1) NULL�� ���� �����ϰ� �߰�
INSERT INTO DEPT_COPY(DNO, DNAME)
VALUES(60, 'SALES');

SELECT * FROM DEPT_COPY;

-- 2) ��������� NULL �߰�
INSERT INTO DEPT_COPY
VALUES(60, 'OPERATIONS', NULL);

--�׽�Ʈ ������ �� EMP_COPY ���̺� �����
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMPLOYEE
WHERE 1=2;

SELECT * FROM EMP_COPY;

--EMP_COPY ���̺� ������ �ֱ�
INSERT INTO EMP_COPY(ENO, ENAME, JOB, HIREDATE, DNO)
VALUES(7000, 'CANDY', 'MANAGER', SYSDATE, 10);
--�ǵ����� (COMMIT �ϱ� ������ ����)
ROLLBACK;
--DB�� �����ݿ�
COMMIT;

--�ٸ� ���̺��� �����͸� �����켭 INSERT�ϱ�
SELECT * FROM DEPT_COPY;
--������/���� ����
TRUNCATE TABLE DEPT_COPY;
--�ٸ� ���̺��� �����͸� �����ؼ� INSERT �ϱ�
INSERT INTO DEPT_COPY
SELECT * FROM DEPARTMENT;

--������ �����ϱ� : UPDATE
SELECT * FROM DEPT_COPY;

--�Ϲ����� ���) UPDATE + WHERE
-- ����)
    --UPDATE ���̺��
    --SET �÷��� = �����Ұ�
    --WHERE ����
UPDATE DEPT_COPY
SET DNAME = 'PROGRAMMING'
WHERE DNO = 10;

--�������
ROLLBACK;
--DB�����ݿ�
COMMIT;

--����1) DEPT_COPY ���̺� LOC �÷��� 'BUSAN'���� �����ϴµ� �μ� ���� SALES�� �ָ� ����
UPDATE DEPT_COPY
SET LOC = 'BUSAN'
WHERE DNAME = 'SALES';

--���빮��2) DEPT_COPY ���̺� �μ���ȣ�� 20�� �μ��� �μ��̸��� 'JAVA'�� �����ϰ� LOC�÷��� 'SEOUL'�� ����
UPDATE DEPT_COPY
SET DNAME = 'JAVA', LOC = 'SEOUL'
WHERE DNO = 20;

--Ư���� ��) DEPT_COPY ���̺� �μ� ��ȣ�� 10�� �����͸� �����ͼ� �μ���ȣ�� 20�� LOC �����ͷ� �����ϱ�
UPDATE DEPT_COPY
SET LOC = (SELECT LOC FROM DEPT_COPY WHERE DNO = 20) --��������(���� ���� ���� ����)
WHERE DNO = 10;


--DELETE : ���̺��� ������ �����ϴ� DML��ɾ�
--���� : 
-- DELETE [FROM] ���̺��
-- WHERE ����
DELETE FROM DEPT_COPY --FROM ���� ����
WHERE DNO = 10;

SELECT * FROM DEPT_COPY;

--����2) DEPT_COPY ���̺��� �μ���ȣ�� 20, 30�� �����͸� �����Ͻÿ�
DELETE FROM DEPT_COPY
WHERE DNO = 20 OR DNO = 30;

--����) DELETE ~ �������� ��� ����
DELETE FROM DEPT_COPY
WHERE DNO = (SELECT DNO FROM DEPARTMENT WHERE DNAME = 'SALES');

-- ����) ROLLBACK / COMMIT
-- Ʈ�����(Transaction) ����
-- ROLLBACK : INSERT/UPDATE/DELETE �������
-- COMMIT : INSERT/UPDATE/DELETE ���� ���� �ݿ�
-- ��) INSERT ~
--      UPDATE ~
--      DELETE ~
--      COMMIT [ROLLBACK] : Ʈ����� ����(1���� Ʈ�����)

-- �������) AUTOCOMMIT : �ڵ� DB ���� �ݿ�
--               ORACLE DB : AUTOCOMMIT = FALSE
--               MYSQL/MARIADB : AUTOCOMMIT = TRUE