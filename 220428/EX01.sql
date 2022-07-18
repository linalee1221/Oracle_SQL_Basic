-- �˻�(R)
-- * : ALL COLUMN ( DEPTNO, DNAME, LOC )
-- select * from DEPT;
-- SELECT �÷��� FROM ���̺�� WHERE �����÷� = '' �Ǵ� LIKE '%';
-- ORDER BY ���Ĵ���÷�[��������] ASC/DESC;
select DEPTNO, DNAME, LOC from DEPT;
-- �� �÷�(DEPTNO)�� ����
select DEPTNO from DEPT;
-- �ٸ� �÷��鵵 �ϳ��� ����
SELECT DNAME FROM DEPT;
SELECT LOC FROM DEPT;

-- ���ǿ� �´� ������ ��������
-- WHERE [������] : ���� ����
-- DEPT ���̺��� DNAME(�μ��̸�)�� SALES�� �����͸� �������� ����
SELECT DNAME FROM DEPT WHERE DNAME = 'SALES';
-- DEPT ���̺� DEPTNO�� 10�� �����͸� ��������
SELECT DEPTNO FROM DEPT WHERE DEPTNO = 10;

-- WHERE [�����÷�] LIKE 'S%'
-- ���� �÷��� S�� ���۵Ǵ� ���ڿ� ��� ��������
SELECT * FROM EMP WHERE ENAME LIKE 'S%';
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S%';

-- EMP ���̺��� JOB�� M���� ���۵Ǵ� ���ڿ��� ���� �����͸� ��� ��������
-- SELECT �ڸ��� ���� �÷��� ��ġ�� ���� ������ ��� ������ �ٲ��
SELECT ENAME, JOB FROM EMP WHERE JOB LIKE 'M%';

-- �����Լ� UPPER(���ڿ�)/LOWER(���ڿ�) : ��/�ҹ��� �ٲٱ�
-- DB ���̺� �����ʹ� ��ҹ��ڸ� ������ ���ڿ��� �ν���
SELECT ENAME, JOB FROM EMP WHERE JOB = UPPER('manager');

-- ���� : ��������
-- SELECT�� �� ���� ORDER BY [�÷���] ASC;
-- DNAME(�μ���)�� ������������ �����ϱ�
SELECT * FROM DEPT ORDER BY DNAME ASC;

-- ���� : ��������
-- SELECT�� �� ���� ORDER BY [�÷���] DESC;
-- DNAME(�μ���)�� ������������ �����ϱ�
SELECT * FROM DEPT ORDER BY DNAME DESC;

-- EMP ���̺��� JOB�� 'MANAGER'�� �����͸� ������������ �����ϱ�
SELECT * FROM EMP WHERE JOB = 'MANAGER' ORDER BY ENAME ASC;

-- EMP ���̺��� JOB�� 'CLERK'�� �����͸� ������������ �����ϱ�
SELECT * FROM EMP WHERE JOB = 'CLERK' ORDER BY ENAME DESC;

-- ���� ����
-- EMP ���̺��� JOB�� 'CLERK'�� �����͸� �̾Ƽ�
-- ENAME(�����̸�), EMPNO(������ȣ)�� �������� �����ϱ�
-- ���������� ������ �÷��� ���� DESC/ASC �ɾ���� ��
SELECT * FROM EMP WHERE JOB = 'CLERK' ORDER BY ENAME DESC, EMPNO DESC;
-- �������� ASC�� ��������
-- ORDER BY 2, 1; �÷� ���̵�ε� ���� ����






