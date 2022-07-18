
-- ���� �ڸ��� Ư�� ��ȣ�� ä��� �����Լ�
-- LPAD(�÷���, �ڸ���, ä�� ����)
SELECT LPAD(SALARY, 10, '*') FROM EMPLOYEE;

-- ������ �ڸ��� Ư�� ��ȣ�� ä��� �����Լ�
-- RPAD(�÷���, �ڸ���, ä�� ����)
SELECT RPAD(SALARY, 10, '*') FROM EMPLOYEE;

-- LTRIM(���ڿ�) : ���� ���� ����
-- RTRIM(���ڿ�) : ������ ���� ����
-- TRIM(���ڿ�) : ���� ���� ����
SELECT ' Oracle mania ', LTRIM(' Oracle mania '), RTRIM(' Oracle mania '), TRIM(' Oracle mania ') FROM DUAL;

-- ���� �Լ�
-- ROUND(�Ǽ�, �ݿø� �� �ڸ� ��(��������) : Ư�� �ڸ������� �ݿø� �ϴ� �����Լ�
SELECT 98.7654, 
ROUND(98.7654), -- ù°�ڸ� �ݿø�
ROUND(98.7654, 2), -- ��°�ڸ� �ݿø�(�Ű������� ��°�ڸ� ����)
ROUND(98.7654, -1) -- ���� 1�ڸ� �ݿø�
FROM DUAL;

-- TRUNC : Ư�� �ڸ������� ����
SELECT 98.7654,
TRUNC(98.7654), -- ù°�ڸ����� ����
TRUNC(98.7654, 2), -- ��°�ڸ����� ����
TRUNC(98.7654, -1) -- ���� 1�ڸ� ����
FROM DUAL;

-- MOD : ù��° ���� �ι�° ������ ���� �������� ��ȯ
SELECT 
MOD(31, 2),
MOD(31, 5),
MOD(31,8)
FROM DUAL;

-- ����1) ��� ����� �޿��� 500���� ���� �������� ��� �� ���

SELECT ENAME, SALARY, MOD(SALARY,500) FROM EMPLOYEE;

-- ��¥ �Լ�
-- �ý��ۿ� ����� ���� ��¥�� ��ȯ�ϴ� ����
SELECT SYSDATE FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS �Ͻ� FROM DUAL;

-- ��¥ ����
SELECT 
SYSDATE -1 AS ����, -- ����
SYSDATE AS ����, -- ����
SYSDATE +1 AS ���� -- ����
FROM DUAL;

-- ��������) ������� ��������� �ٹ��ϼ� ���ϱ�
-- �������̺� : EMPLOYEE
-- �Ի��� : HIREDATE

SELECT ENAME, ROUND(SYSDATE - HIREDATE) AS �ٹ��ϼ� FROM EMPLOYEE;

-- ��¥�� ��¥ ������ ���� ���� ���ϴ� �����Լ�
-- MONTHS_BETWEEN(���糯¥, ���ų�¥)
-- �ٹ��ϼ��� �������� ����� ����
SELECT ENAME, SYSDATE, HIREDATE, 
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS ������
FROM EMPLOYEE;

-- �Ի����� 6���� ���� ��¥�� ���ϴ� ����
-- ADD_MONTHS(��¥�÷�, ���� ������) : ��¥�÷� + 6����
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) AS "6���� ��"
FROM EMPLOYEE;

-- ������ �������� ���ʷ� �����ϴ� ����� ���ϱ�
-- NEXT_DAY(��¥, ����)
SELECT SYSDATE, 
NEXT_DAY(SYSDATE, '�����') AS "�̹��� �����",
NEXT_DAY(SYSDATE, 7) AS "���ڷ� �̹��� �����"
FROM DUAL;

-- �Ի��� ���� ������ �� ���ϱ�
SELECT ENAME, HIREDATE,
LAST_DAY(HIREDATE)
FROM EMPLOYEE;

-- �ڷ��� ��ȯ �Լ�
-- TO_CHAR : ��¥�� �Ǵ� �������� ���������� ��ȯ�ϴ� �����Լ�
-- TO_CHAR(��¥�÷�, ��������) : ��¥�� ������ ������ ���� ���ڿ��� ��ȯ
SELECT ENAME, HIREDATE,
TO_CHAR(HIREDATE, 'YY/MM') AS "�Ի翬��",
TO_CHAR(HIREDATE, 'YYYY/MM/DD DAY') AS "�Ի翬����/����",
TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') AS "���� ���� ����"
FROM EMPLOYEE;
 
-- TO_CHAR : ���ڸ� ������ ������ ���� ���ڿ��� ��ȯ
-- 9 : �ڸ����� ��Ÿ��, �ڸ����� ���� ������ ������ ä���� ����
-- 0 : �ڸ����� ��Ÿ��, �ڸ����� ���� ������ 0���� ä��
-- L : �� ������ ��ȭ ��ȣ�� �տ� ǥ����
-- , : õ ���� �ڸ� ������ ���� ǥ��
SELECT ENAME, SALARY,
TO_CHAR(SALARY, 'L999,999') AS "�� ǥ��",
TO_CHAR(SALARY, 'L000,000') AS "�� ǥ��2"
FROM EMPLOYEE;

--  TO_DATE : ���ڸ� ��¥�� ��ȯ�ϴ� ���� �Լ�
-- ��������) 1981�� 2�� 20�Ͽ� �Ի��� ��� �˻��ϱ�
-- ��� ���̺� : EMPLOYEE
-- �Ի��� �÷� : HIREDATE
SELECT ENAME, HIREDATE 
FROM EMPLOYEE WHERE HIREDATE=TO_DATE('19810220', 'YYYYMMDD');

-- ���ڸ� ���ڷ� �ٲٴ� �����Լ�
-- TO_NUMBER (���ڿ� ����, ��������) : ���ڿ��� ������ ������ ���ڷ� �ٲٱ�
SELECT TO_NUMBER('100,000', '999,999') - TO_NUMBER('50,000','999,999')
FROM DUAL;

-- ����1) SUBSTR �Լ��� ����Ͽ� ������� �Ի翬���� �Ի���� ���
-- ��Ʈ ������� : SELECT ����, �� FROM EMPLOYEE 
SELECT ENAME, HIREDATE,  
SUBSTR(HIREDATE, 1, 2) AS �Ի翬��, 
SUBSTR(HIREDATE, 4, 2) AS �Ի�� 
FROM EMPLOYEE;

-- ����2) SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ���
SELECT * FROM EMPLOYEE WHERE SUBSTR(HIREDATE, 4, 2)='04';

-- ����3) MOD�Լ��� ����Ͽ� ����� ¦���� ��� ���
SELECT * FROM EMPLOYEE WHERE MOD(ENO, 2) = 0;

-- ����4) ���� ��ĥ�� �������� ���(���糯¥���� ���� 1�� 1���� �� ��� ���)
-- ��, TO_DATE �Լ��� ����ؼ� ���� ��ġ���� ���
SELECT TRUNC(SYSDATE - TO_DATE('20220101', 'YYYYMMDD')) FROM DUAL;

-- �Ϲ� �Լ�
-- NVL(NULL�� ���Ե� �÷�, �ٲ� ��) : NULL�̸� 0 �Ǵ� �ٸ� ������ �ٲٴ� ���� �Լ�
SELECT ENAME, SALARY, COMMISSION, 
NVL(COMMISSION,0) AS "���ʽ�", 
SALARY * 12 + NVL(COMMISSION,0) AS "����"
FROM EMPLOYEE ORDER BY JOB;

-- NVL2(�÷���, ǥ����1, ǥ����2)
-- �÷����� NULL�̸� ǥ����2�� ��ȯ�ϰ�, NULL�� �ƴϸ� ǥ����1�� ��ȯ
SELECT ENAME, SALARY, COMMISSION, 
NVL2(COMMISSION, SALARY*12 + COMMISSION, SALARY*12)
FROM EMPLOYEE ORDER BY JOB;

-- NULLIF(ǥ����1, ǥ����2)
-- ǥ�ǽ� 1 == ǥ����2 �̸� NULL�� ���, �ƴϸ� ǥ�ǽ� 1�� ���
SELECT NULLIF('A', 'A'), NULLIF('A', 'B') FROM DUAL;

-- ����Ŭ���� IF/ELSE �ϴ� ���
-- DECODE(ǥ����, ����1, ���2
--                        ����2, ���2
--                        ����3, ���3
--                        �� �ƴϸ� ����� �� �⺻ ���)
SELECT ENAME, DNO, DECODE(DNO, 10, 'ȸ���', 20, '������', 30, '������', 40, '���', 'DEFAULT') AS "�μ��̸�"
FROM EMPLOYEE ORDER BY DNO;

-- �Ǵٸ� ��� IF / ELSE IF / ELSE ���
SELECT ENAME, DNO, 
CASE WHEN DNO = 10 THEN 'ȸ���'
         WHEN DNO = 20 THEN '������'
         WHEN DNO = 30 THEN '������'
         WHEN DNO = 40 THEN '���'
                   ELSE 'DEFAULT'
END AS "�μ��̸�"
FROM EMPLOYEE ORDER BY DNO;

-- ����5) ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL�� ���
-- 0�� ����Ͻÿ�
-- ������̺� : ELPLOYEE
-- ����÷� : MANAGER
SELECT ENO, ENAME, NVL2(MANAGER, MANAGER,0) AS "���" FROM EMPLOYEE;


-- ����6) DECODE Ȥ�� CASE WHEN �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�
-- ������ 'ANALYST'�� ����� 200, 'SALESMAN'�� ����� 180, 'MANAGER'�� ����� 150,
-- 'CLERK'�� ����� 100���� �λ�
SELECT ENO, ENAME, JOB, SALARY,
DECODE(JOB, 'ANALYST', SALARY+200,
                    'SALESMAN', SALARY+180,
                    'MANAGER', SALARY+150,
                    'CLERK', SALARY+100,
                    SALARY) AS "�λ� ��"
FROM EMPLOYEE;

-- �׷��Լ�
-- SUM : ���� �հ踦 ��ȯ
-- AVG : �׷��� ����� ��ȯ
-- COUNT : �׷��� ������ ��ȯ
-- MAX : �׷��� �ִ밪�� ��ȯ
-- MIN : �׷��� �ּҰ��� ��ȯ
SELECT 
SUM(SALARY) AS "�޿� �Ѿ�", 
TRUNC(AVG(SALARY)) AS "�޿� ���",
MAX(SALARY) AS "�ִ� �޿�",
MIN(SALARY) AS "�ּ� �޿�"
FROM EMPLOYEE;

-- ����7) �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �Ի��� ���
-- ������̺� : EMPLOYEE
-- �Ի��� : HIREDATE
SELECT MAX(HIREDATE) AS �ֱ�, MIN(HIREDATE) AS ������ FROM EMPLOYEE;

-- �׷��Լ� VS NULL : NULL�� ���������� �����ϰ� �������
SELECT SUM(COMMISSION) AS "Ŀ�̼� �Ѿ�" FROM EMPLOYEE;

-- COUNT : �Ǽ� ����
SELECT COUNT(*) FROM EMPLOYEE;

-- COMMISSION�� �޴� ����� ���� ���
-- �׷��Լ��� NULL�� �����ϱ� ������ Ŀ�̼��� �޴� ��� ���� ���� �� �ִ�
SELECT COUNT(COMMISSION) FROM EMPLOYEE;
SELECT COUNT(COMMISSION) FROM EMPLOYEE WHERE COMMISSION IS NOT NULL;
-- ������ ����� �����

-- Ȱ�� ��)
SELECT COUNT(JOB) AS "������ ����" FROM EMPLOYEE;
-- �ߺ��� �����ϰ� ���� ��
SELECT COUNT(DISTINCT JOB) AS "�ߺ� ����" FROM EMPLOYEE;

-- �׷��Լ��� �� �� �����ؾ� �� ��
-- �Ϲ� �÷��� ���� �� �� ����, �׷��Լ����� ��� ��
SELECT COUNT(ENO), MAX(SALARY) FROM EMPLOYEE;

DESC EMPLOYEE;

-- ** GROUP BY ��
-- �׷��Լ� : �ϳ��� ������� ������(COUNT, MAX, SUM)
-- ����) �μ��� ��� �޿��� ����ϰ� ���� ��
-- GROUP BY �÷��� => SELECT �÷��� ���ƾ���
SELECT DNO AS "�μ���ȣ", TRUNC(AVG(SALARY)) AS "��� �޿�" FROM EMPLOYEE
GROUP BY DNO; -- �μ���ȣ�� �׷�ȭ

-- O, X
-- �߸��� ���� ���� : ENAME -> GROUP BY ���� ���� �÷�.
SELECT DNO, AS "�μ���ȣ", ENAME, TRUNC(AVG(SALARY)) AS "��� �޿�"
FROM EMPLOYEE GROUP BY DNO;

-- ��������) �μ���, ���޺� �ѱ޿��� ����Ͽ� ���
-- �μ��÷� : DNO, �����÷� : JOB, ������̺� : EMPLOYEE
SELECT DNO AS "�μ���ȣ", JOB AS "����", SUM(SALARY) AS "�� �޿�" FROM EMPLOYEE
GROUP BY DNO, JOB;

-- GROUPT BY ���� ���ǰɱ�
-- �μ����� �ִ� �޿��� ���ϴµ� �Ѿ��� 3000 �̻��� �����͸� ���
-- GROUPT BY ������ HAVING���� �Ǵ�.
SELECT DNO AS "�μ���ȣ", MAX(SALARY) AS "�޿�" FROM EMPLOYEE
GROUP BY DNO 
HAVING MAX(SALARY) >= 3000;

-- ��������) MANAGER�� �����ϰ� �޿� �Ѿ��� 5000�̻��� ���޺� �޿� �Ѿ�(SUM) ���ϰ�
-- �޿��Ѿ��� �������� �������� ����
-- �������̺� : EMPLOYEE, �����÷� : JOB, �޿��÷� : SALARY
SELECT JOB, SUM(SALARY) FROM EMPLOYEE WHERE JOB NOT LIKE '%MANAGER%'
GROUP BY JOB
HAVING SUM(SALARY) >= 5000
ORDER BY SUM(SALARY);

-- ����1) ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿� ���
SELECT 
MAX(SALARY) AS "�ְ��",
MIN(SALARY) AS "������", 
SUM(SALARY) AS "�޿��Ѿ�", 
ROUND(AVG(SALARY)) AS "��ձ޿�"
FROM EMPLOYEE;

-- ����2) �� ������ �������� �޿� �ְ��, ������, �Ѿ� �� ��վ� ���
SELECT JOB AS "��� ����",
MAX(SALARY) AS "�ְ��",
MIN(SALARY) AS "������",
SUM(SALARY) AS "�޿��Ѿ�",
ROUND(AVG(SALARY)) AS "��ձ޿�"
FROM EMPLOYEE
GROUP BY JOB;

-- ����3) COUNT(*) �Լ��� �̿��Ͽ� ��� ������ ������ ��� �� ���
-- �������̺� : EMPLOYEE
SELECT JOB, COUNT(*) FROM EMPLOYEE GROUP BY JOB;

-- ����4) ������ ���� ���
SELECT COUNT(MANAGER) AS "������ ��" FROM EMPLOYEE;

-- ����5) �޿� �ְ��, �޿� �������� ������ ���
-- �÷��� : "����"
SELECT
MAX(SALARY) AS "�ְ��", 
MIN(SALARY) AS "������",
(MAX(SALARY)-MIN(SALARY)) AS "����"
FROM EMPLOYEE;

-- ����6) ���޺� ����� �����޿� ���(��, �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000 �̸��� �׷� ����)
-- ����� �޿��� ���� ������������ ����
-- �׷��Լ����� �ڵ����� NULL�� ���� ���
SELECT JOB, MIN(SALARY) FROM EMPLOYEE
WHERE MANAGER IS NOT NULL
GROUP BY JOB
HAVING NOT MIN(SALARY) < 2000
ORDER BY MIN(SALARY) DESC;

-- ����7) �� �μ��� ���� �μ���ȣ, �����, �μ� ���� ��� ����� ��� �޿��� ���(�μ��� �����, ��ձ޿� ���)
-- �÷���Ī : �μ���ȣ, �����, ��ձ޿�
-- ��ձ޿��� �Ҽ��� ��°�ڸ����� �ݿø�

SELECT DNO, 
COUNT(*) AS "�����",
ROUND(AVG(SALARY), 2) AS "��ձ޿�"
FROM EMPLOYEE
GROUP BY DNO;

-- ���� 8) �� �μ��� ���� �μ��̸�, ������, �����
-- �μ��� ����� ��� �޿� ���(DECODE, CASE WHEN)
-- �÷���Ī : �μ��̸�, ������, �����, ��ձ޿�
-- �μ��̸� �� �������� DEPARTMENT�� DNAME, LOC ������ ����
-- 1) 1�� DECODE ���� ���ϱ�
-- 2) 2�� DECODE�� CASE WHEN�� �����ϱ�
SELECT 
DECODE(DNO, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS') AS �μ��̸�,
DECODE(DNO, 10, 'NEW YORK', 20, 'DALLAS', 30, 'CHICAGO', 40, 'BOSTON') AS ������,
COUNT(*) AS "�����",
TRUNC(AVG(SALARY)) AS "��ձ޿�"
FROM EMPLOYEE
GROUP BY DNO;