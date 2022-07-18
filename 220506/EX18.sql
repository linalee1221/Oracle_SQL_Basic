-- ��������(�ڽ�����) (�߿�!!)
-- =�������� : ������ 1�Ǹ� ��
-- SELECT �ȿ� �� �ٸ� SELECT�� ���Ե� ����
-- ����) SELECT �÷�����Ʈ FROM ���̺�� WHERE �÷��� = (SELECT��);
-- ��) SCOTT�� ������ �μ����� �ٹ��ϴ� ��� ���

SELECT ENAME, DNO FROM EMPLOYEE WHERE DNO = (SELECT DNO FROM EMPLOYEE WHERE ENAME = 'SCOTT');


-- ���������� HAVING�� ����ϱ�
SELECT DNO, MIN(SALARY) AS �ּұ޿�
FROM EMPLOYEE GROUP BY DNO
HAVING MIN(SALARY) > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DNO = 30);


-- ���� �� ��������(SUBQUERY)
-- IN / EXIST ������ ��
-- ���� : EXIST�� �˻� �ӵ��鿡�� �ξ� ����
-- IN : ���������� �� ������ ���� ������ ����߿��� �ϳ��� ��ġ�ϸ� ��
-- ��ȸ���� : �������� ���� ���� -> �������� �����ϸ鼭 ���� ��
-- EXIST : ���������� �� ������ ���������� ����߿��� �����ϴ� ���� �ϳ��� �����ϸ� ��
-- ��ȸ���� : �������� ���� ���� -> ���������� ������ ���ϴٰ� �����ϸ� BREAK�� ��������

-- ���� �� ��������
-- ��)
-- ���������� ��ȸ�غ��� �� 1�� ������ =�� ���� 1�� �̻� ������ ()�� �����ش�
SELECT ENO, ENAME FROM EMPLOYEE WHERE SALARY IN
(SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);

-- EXISTS ��뿹) IN����  ��ȸ �ӵ��� ����
SELECT ENO, ENAME FROM EMPLOYEE A
WHERE EXISTS(SELECT 1 FROM EMPLOYEE GROUP BY DNO HAVING A.SALARY = MIN(SALARY));
