-- ����1) �����ȣ�� 7788�� ����� �������� ���� ����� ǥ��
-- ��Ʈ : =�������� ��� / ������ : JOB / ������̺� : EMPLOYEE

SELECT ENAME, ENO, JOB FROM EMPLOYEE WHERE JOB = (SELECT JOB FROM EMPLOYEE WHERE ENO = '7788');

-- ����2) �ּ� �޿��� �޴� ����� �̸�, ������, �޿� ���
SELECT ENAME, JOB, SALARY FROM EMPLOYEE WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- ����3) ��� �޿��� ���� ���� ����� ��� ������ ã�� ���ް� ��� �޿��� ǥ��
-- (���������� �ּ� ��ձ޿��� ���� = ��ձ޿��� �������� ����� ������)
-- ������
-- ������ : JOB / ������̺� : EMPLOYEE
SELECT JOB, ROUND(AVG(SALARY), 1) AS ��ձ޿�
FROM EMPLOYEE GROUP BY JOB
HAVING ROUND(AVG(SALARY), 1) = (SELECT MIN(ROUND(AVG(SALARY),1)) FROM EMPLOYEE GROUP BY JOB);


-- ���� 4) �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
-- ��Ʈ : IN ��������
SELECT ENAME, SALARY, DNO FROM EMPLOYEE 
WHERE SALARY IN(SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);

-- ���� 5) �Ŵ����� ���� ����� �̸��� ǥ���Ͻÿ�.
SELECT ENAME, MANAGER FROM EMPLOYEE WHERE ENO IN
(SELECT ENO FROM EMPLOYEE WHERE MANAGER IS NULL);


-- ���� 6) �Ŵ����� �ִ� ����� �̸��� ǥ���Ͻÿ�.
SELECT ENAME, MANAGER FROM EMPLOYEE 
WHERE ENO IN(SELECT ENO FROM EMPLOYEE WHERE MANAGER IS NOT NULL);

-- ���� 7) BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ�
-- �ۼ��Ͻÿ�.( ��, BLAKE�� �����Ͻÿ�. )
SELECT ENAME, HIREDATE FROM EMPLOYEE
WHERE DNO = (SELECT DNO FROM EMPLOYEE WHERE ENAME = 'BLAKE')
AND ENAME <> 'BLAKE';