-- �� DML(������ ���۾�) �ǽ� ��

-- ������ ������ ���̺� ����� ���� SQL��ɾ�
SELECT * FROM USER_TABLES;

-- ��������
-- 1) EMPLOYEE ���̺��� ������ �����Ͽ� EMP_INSERT�� �̸��� �� ���̺� ����
CREATE TABLE EMP_INSERT AS
SELECT * FROM EMPLOYEE
WHERE 1=2; -- ���������� ����� �����ʹ� �ȵ����� ������ �����ؿ� �� �ִ�
-- �� ����������� Ȯ���ϱ�
SELECT * FROM EMP_INSERT;

-- 2) ������ EMP_INSERT(�ӽ� ���� ���̺�) ���̺� �߰��ϵ� SYSDATE�� �̿��ؼ� �Ի���(HIREDATE)�� ���÷� �Է�
-- ���̺� ���� ���¹�
DESC EMP_INSERT;
-- �÷� ����� ���� ��ųʸ�
SELECT TABLE_NAME, COLUMN_ID, COLUMN_NAME
FROM USER_TAB_COLUMNS
ORDER BY TABLE_NAME, COLUMN_ID;
-- ���̺� ������ �ֱ�
INSERT INTO EMP_INSERT
VALUES(1, 'EUNSONG', 'STAFF', NULL, SYSDATE, 2700, 230, 10);
SELECT * FROM EMP_INSERT;

-- 3) EMP_INSERT(�ӽ� ���� ���̺�) ���̺� �� ����� �߰��ϵ� TO_DATE �Լ��� �̿��ؼ� �Ի���(HIREDATE)�� ������ �Է�
-- ������¥ �Է��ϱ� : SYSDATE-1
INSERT INTO EMP_INSERT
VALUES(2, 'JUNGMK', 'SOLDIER', NULL, TO_DATE(SYSDATE-1, 'YY/MM/DD'), 1150, NULL, 20);
-- ������ Ȯ��
SELECT * FROM EMP_INSERT;

-- 4) EMPLOYEE ���̺��� ������ ������ �����Ͽ� EMP_COPY ���̺� ����
CREATE TABLE EMP_COPY AS
SELECT * FROM EMPLOYEE;
-- ���̺� Ȯ��
SELECT * FROM EMP_COPY;

-- �������� : DML(������ ���۾�) �ǽ�
-- 5) �����ȣ�� 7788�� ����� �μ���ȣ(DNO)�� 10������ ����
-- ������̺� : EMP_COPY
UPDATE EMP_COPY
SET DNO=10
WHERE ENO=7788;

-- 6) �����ȣ 7788�� ������(JOB) �� �޿�(SALARY)�� �����ȣ 7499�� ��ġ�ϵ��� ����
-- ������̺� : EMP_COPY
UPDATE EMP_COPY
SET(JOB, SALARY) = (SELECT JOB, SALARY FROM EMP_COPY WHERE ENO=7499)
WHERE ENO=7788;

-- 7) DEPARTMENT ���̺��� ������ ������ �����Ͽ� DEPT_COPY ����
CREATE TABLE DEPT_COPY AS
SELECT * FROM DEPARTMENT;


-- 8) DEPT_COPY ���̺��� �μ���(DENAME)�� RESEARCH�� �μ��� ����
DELETE FROM DEPT_COPY
WHERE DNAME='RESEARCH';

-- 9) DEPT_COPY ���̺��� �μ� ��ȣ�� 10 �̰ų� 40�� �μ��� ����
DELETE FROM DEPT_COPY
WHERE DNO IN(10, 40);

SELECT * FROM DEPT_COPY;

COMMIT;

-- ��������
-- DEPT_COPY ���̺��� �μ���(DNAME)�� 'SALES'�̸� ������(LOC)�� 'SEOUL'�̶�� �����ϰ�
-- �ƴϸ� 'BUSAN'�̶�� ����
UPDATE DEPT_COPY
SET LOC=DECODE(DNAME,'SALES','SEOUL','BUSAN');

SELECT * FROM DEPT_COPY;
COMMIT;
