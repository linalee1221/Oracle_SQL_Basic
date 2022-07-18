-- ��������1)
-- ���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ����� ��
-- ����� �̸�, �޿�, �λ�� �޿��� ���
SELECT ENAME, SALARY, SALARY+300 AS �޿��λ� FROM EMPLOYEE;

-- ��������2)
-- ����� �̸�, �޿�, ���� �� ������ �� ������ �����ͺ��� ���������� ���
-- ���� �� ���� = ���� * 12 + 100
SELECT ENAME, SALARY, SALARY*12+100 AS "���� �� ����" FROM EMPLOYEE ORDER BY SALARY DESC;

-- ��������3)
-- �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ���� �ͺ��� ���� ������ ���
SELECT * FROM EMPLOYEE WHERE SALARY >2000 ORDER BY SALARY DESC;

-- ��������4)
-- �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ���
SELECT ENAME, DNO FROM EMPLOYEE WHERE ENO=7788;

-- ��������5)
-- �޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ���
SELECT ENAME, SALARY FROM EMPLOYEE WHERE SALARY NOT BETWEEN 2000 AND 3000;

-- ��������6)
-- 1981�� 2�� 20�Ϻ��� 1981�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ��� ����, �Ի����� ���
-- �÷��� : ENAME(�̸�), JOB(������), HIREDATE(�Ի���)
SELECT ENAME, JOB, HIREDATE FROM EMPLOYEE WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01';

-- ��������7)
-- �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� �������� ��������
SELECT ENAME, DNO FROM EMPLOYEE WHERE DNO IN(20,30) ORDER BY ENAME DESC;

-- ��������8)
-- ����� �޿��� 2000���� 3000 ���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� 
-- ����ϵ� �̸��� �������� ��������
SELECT ENAME, SALARY, DNO FROM EMPLOYEE WHERE SALARY BETWEEN 2000 AND 3000 AND DNO IN (20,30) ORDER BY ENAME;

-- ��������9)
-- LIKE �����ڿ� ���ϵ� ī��(%)�� ����Ͽ� 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ���
SELECT ENAME, HIREDATE FROM EMPLOYEE WHERE HIREDATE LIKE '81%';

-- ��������10)
-- ������(MANAGER)�� ���� ����� �̸��� ��� ���� ���
SELECT ENAME, JOB FROM EMPLOYEE WHERE MANAGER IS NULL;

-- ��������11)
-- COMMISSION�� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ�
-- �޿� �� Ŀ�̼��� �������� ��������
SELECT ENAME, SALARY, COMMISSION FROM EMPLOYEE WHERE COMMISSION IS NOT NULL ORDER BY SALARY DESC, COMMISSION DESC;

-- ��������12)
-- �̸��� ����° ���ڰ� R�� ����� �̸��� ���
SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE '__R%';

-- ��������13)
-- �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ���
SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%';

-- ��������14)
-- ������(JOB)�� �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ�
-- ����� �̸�, ������, �޿��� ���
SELECT ENAME, JOB, SALARY FROM EMPLOYEE WHERE JOB IN('CLERK', 'SALESMAN') AND SALARY NOT IN(1600, 950, 1300);

-- ��������15)
-- Ŀ�̼�(�󿩱�)�� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ���
SELECT ENAME, SALARY, COMMISSION FROM EMPLOYEE WHERE COMMISSION >=500;

