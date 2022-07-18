-- �������� : ��������(Constraint) �ǽ�
-- 1) EMPLOYEE ���̺��� ������ �����Ͽ� EMP_SAMPLE ���̺� ����
--    ��� ���̺��� �����ȣ �÷��� ���̺� ������ PRIMARY KEY ���������� �����ϵ�,
--    �������� �̸��� PK_MY_EMP�� ����

CREATE TABLE EMP_SAMPLE AS
SELECT * FROM EMPLOYEE
WHERE 1=0; -- ���̺� ������ �����ðű� ������ ���������� ������ش�
-- �⺻Ű ����
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT PK_MY_EMP PRIMARY KEY(ENO);

-- 2) DEPARTMENT ���̺��� ������ �����Ͽ� DEPT_SAMPLE ���̺� ����
--    �μ���ȣ �÷�(DNO)�� PRIMARY KEY ���������� �����ϵ�,
--    �������� �̸��� PK_MY_DEPT�� ����

CREATE TABLE DEPT_SAMPLE AS
SELECT * FROM DEPARTMENT
WHERE 1=0;

ALTER TABLE DEPT_SAMPLE
ADD CONSTRAINT PK_MY_DEPT PRIMARY KEY(DNO);


-- 3) ��� ���̺��� �μ���ȣ �÷��� �������� �ʴ� �μ��� ����� �������� �ʵ���
--    �ܷ� Ű(FOREIGN KEY:FK) ���������� �����ϵ�, FK_MY_DEPT_EMP�� ����
-- ����Ű, �ܷ�Ű
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT FK_MY_DEPT_EMP
FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO);

