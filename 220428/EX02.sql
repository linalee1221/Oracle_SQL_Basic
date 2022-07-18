-- DESC ���̺��
-- ���̺��� ������ �����ִ� ��ɾ�
-- NUMBER : ����, �Ǽ��� ǥ���ϴ� �ڷ���
-- NUMBER(4) : 4�� ���� 4�ڸ�
-- NUMBER(7,2) : 7�� ���� �ڸ� �� 7�ڸ�, 2�� �Ҽ� �ڸ� �� 2�ڸ�
-- VARCHAR2 : ���ڿ��� ǥ���ϴ� �ڷ���
-- UTF8 ���� : ���� 1Byte, �ѱ� 3Byte
-- KSC5601 : ���� 1Byte, �ѱ� 2Byte
-- VARCHAR2(10) : 10=�ڸ����� �ǹ���
-- DATE : ��¥�� ǥ���ϴ� �ڷ���
DESC EMPLOYEE;

-- SELECT ���� �÷�*12 ��Ģ������ ����
SELECT ENAME, SALARY, SALARY*12 FROM EMPLOYEE;

-- SELECT ���� �÷� + �ٸ��÷� => ����� ����
-- �÷� + �ٸ��÷�(NULL���� ������) = ���� ����� NULL�� ��
-- SALARY : ����
-- SALARY*12 : ����

-- SALARY*12 + COMMISSION(���ʽ�) : ���� 1��ġ ������ ����
SELECT ENAME, SALARY, JOB, DNO, COMMISSION,
           SALARY*12, SALARY*12+COMMISSION
FROM EMPLOYEE;

-- ������) ��� ���� NULL�� �־ ����� ���� 1��ġ ������ ������ ����
-- �ذ�) NULL �÷��� 0���� ��ȯ�Ͽ� ������ ����� ����ǰ� �� [NVL(�÷���, ���氪) �����Լ� ����]
-- SELECT���� AS�� ����Ͽ� �÷��� ��Ī ���� �� �ִµ� AS �ڿ� ������ �÷����� ��
SELECT ENAME, SALARY, JOB, DNO, NVL(COMMISSION,0),
           SALARY*12 AS ����, SALARY*12+NVL(COMMISSION,0) AS ��������
FROM EMPLOYEE;


-- �÷��� ��Ī �ֱ�
SELECT ENAME, SALARY, JOB, DNO, NVL(COMMISSION,0),
           SALARY*12 AS "��  ��  ��", SALARY*12+NVL(COMMISSION,0) AS ��������
FROM EMPLOYEE;
        
-- DISTINCT : �÷��� �ߺ��� ���� �����ϰ� ����(���̺� �����Ϳ��� ������ ����)
SELECT DISTINCT DNO AS �μ���ȣ FROM EMPLOYEE;

-- �׽�Ʈ��, ���� ���� �������̺�
-- ���̺�� : DUAL

DESC DUAL;

SELECT 10*4/3 FROM DUAL;

-- ����ð�, ��¥ ����ϴ� �����Լ�
SELECT SYSDATE FROM DEPARTMENT;

-- �� �Ǹ� ǥ���ϰ� ������ �����Ͱ� �ϳ��� ���� ���̺��� ������(���⼭�� DUAL)
-- DISTINCT�� �ɾ �ǳ� �ӵ��� ���ϵ�
SELECT SYSDATE FROM DUAL;

-- ���� : ���� �˻�
-- SALARY�� 1500 �̻��� �����͸� ����
-- = : ����, > : ���� ũ��, < : ���� �۴� <> : ���� �ʴ�
SELECT * FROM EMPLOYEE WHERE SALARY >=1500;

-- ����1) ����(EMPLOYEE)���̺��� �μ���ȣ�� 20���� ū �����͸� ���
SELECT * FROM EMPLOYEE WHERE DNO >=20;

-- ���ڿ� �˻� : Ȭ����ǥ(' ')
SELECT * FROM EMPLOYEE WHERE ENAME = 'SCOTT';

-- ��¥ ������ �˻�
SELECT * FROM EMPLOYEE WHERE HIREDATE <='1981/01/01';

-- ��¥ ������ �����ؼ� ���ڿ��� ����ϴ� �����Լ�
-- TO_CHAR(�÷���, ������ ���� ���) : ��¥, ��¥�÷� => ���ڿ��� ����(������ ����)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- ���ڿ��� ��¥ ������ �������� �����ϴ� �����Լ�
SELECT TO_DATE('2022-04-29 17:10:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- �������� : AND(�� �� ���̸� ��), OR(�� �߿� �ϳ��� ���̸� ��), NOT(�ݴ�)

-- ����2) �μ���ȣ�� 10�̰� ������ 'MANAGER'�� �����͸� ����ϱ�
-- DNO : �μ���ȣ / JOB : ����

SELECT * FROM EMPLOYEE WHERE DNO =10 AND JOB ='MANAGER';

-- ����3) �μ���ȣ�� 10�̰ų� ������ 'MANAGER'�� �����͸� ����ϱ�

SELECT * FROM EMPLOYEE WHERE DNO =10 OR JOB = 'MANAGER';

-- ����4) 10�� �μ��� �Ҽӵ� ����� �����ϰ� ������ ����� ������ ���
SELECT * FROM EMPLOYEE WHERE DNO <>10;

-- ����5) �޿��� 1000���� 1500 ������ �����͸� ���
SELECT * FROM EMPLOYEE WHERE SALARY >=1000 AND SALARY <=1500;

-- ����6) �޿��� 1000 �̸��̰ų� 1500 �ʰ��� �����͸� ���
SELECT * FROM EMPLOYEE WHERE SALARY <1000 OR SALARY >1500;

-- ����7) Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� �����͸� ���
SELECT * FROM EMPLOYEE WHERE COMMISSION =300 OR COMMISSION =500 OR COMMISSION =1400;

-- ���� �˻� 2
SELECT * FROM EMPLOYEE WHERE SALARY >=1000 AND SALARY <=1500;

-- WHERE �� �÷��� BETWEEN �ʱⰪ AND ����
-- �ʱⰪ ~ ���� ������ ���� �����
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 1000 AND 1500;

-- ���� �� ���ϱ�
SELECT * FROM EMPLOYEE WHERE SALARY <1000 OR SALARY >1500;
-- �ʱⰪ���� �۰ų� �������� ū��
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 1000 AND 1500;

-- ����8) 1982�⿡ �Ի��� ����ϱ�
-- BETWEEN AND�� �Ἥ ����ϱ�
SELECT * FROM EMPLOYEE WHERE HIREDATE BETWEEN '1982-01-01' AND '1982-12-31';

-- COMMISSION�� 300�̰ų� 500�̰ų� 1400�� �����͸� ���
SELECT * FROM EMPLOYEE WHERE COMMISSION =300 OR COMMISSION =500 OR COMMISSION =1400;
-- ���� ������ ����� �����ִ� ����
SELECT * FROM EMPLOYEE WHERE COMMISSION IN (300, 500, 1400);

-- COMMISSION�� 300�� �ƴϰ� 500�� �ƴϰ� 1400�� �ƴ� ������ ���
SELECT * FROM EMPLOYEE WHERE COMMISSION <> 300 AND COMMISSION <> 500 AND COMMISSION <> 1400;
-- ���� ������ ����� �����ִ� ����
SELECT * FROM EMPLOYEE WHERE COMMISSION NOT IN (300,500,1400);

