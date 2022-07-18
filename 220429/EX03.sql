-- LIKE ��� �����ؼ� ����
-- 1) WHERE �÷��� LIKE '����%'
-- Ư�� ���ڰ� �ִ� �����ʹ� ��� �̱�
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'F%';

-- 2) WHERE �÷��� LIKE '%����%'
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%M%';

-- ����9) ��� ���̺��� �̸��� N���� ������ ������ ���
-- �̸� �÷��� : ENAME

SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%N';

-- % : ���ڰ� ���ų� �ϳ� �̻��� ���ڰ� � ���� �͵� ��� ����
-- _ : �ϳ��� ���ڰ� � ���� �͵� ����� ����
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '_A%';

-- �̸��� ����° ���ڰ� A�� ������ ���
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '__A%';

-- �̸��� A�� �ȵ��� ������ ���
SELECT * FROM EMPLOYEE WHERE ENAME NOT LIKE '%A%';

-- NULL : �ƹ� ����, ������ ���� ��
-- NULL�� ������ �ϸ� NULL�� ��
-- IS NULL : NULL�� �����͸� ���
SELECT * FROM EMPLOYEE WHERE COMMISSION IS NULL;

-- IS NOT NULL : NULL�� �ƴ� �����͸� ���
SELECT * FROM EMPLOYEE WHERE COMMISSION IS NOT NULL;

-- ����10) COMMISSION�� NULL�� �� �߿��� SALARY�� 1000���� ū ������ ���
SELECT * FROM EMPLOYEE WHERE COMMISSION IS NULL AND SALARY >=1000;

-- ����11) ���� ���̺��� ��¥ ������ ������������ �����Ͽ� ���
SELECT * FROM EMPLOYEE ORDER BY HIREDATE DESC;

-- ����12) ������ �޿��� �޴� ����� ���ؼ� �̸��� ������ ���� ������� ���
SELECT * FROM EMPLOYEE ORDER BY SALARY, ENAME;





