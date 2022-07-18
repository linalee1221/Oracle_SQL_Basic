-- INDEX �ǽ�

-- �ַ� ��ȸ�� ���� ��� �÷��� ����
-- �ε��� ���� : ��ȸ(SELECT) ������ ���̱� ���� ������
-- �ε��� �˰��� : B* TREE (�˻� �ӵ� ��� �˰���)
-- ���� : CREATE INDEX �ε����̸� ON ���̺��(�÷���);
-- �ε����� �ɾ�� �ϴ� �÷�
-- 1) ���̺� ���� ���� �ʹ� ���� �� : 10���� �̻�
-- 2) WHERE ���� ��� �÷��� �ʹ� ���� ���� ��
-- 3) �˻� ��� ��ü�� �뷫 2% ~ 5% ���� ���� �� (�ݴ�� 10% �̻��� �� �ε��� �ɸ� �� �� ����)
-- 4) ���ο� ���Ǵ� �÷��� �ε����� �Ŵ� ���� ���
-- ��) 
CREATE INDEX IDX_EMPLOYEE_ENAME
ON EMPLOYEE(ENAME);

-- �ε��� ���� Ȯ��(�ε��� ���� ��ųʸ�)
SELECT * FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPLOYEE';

-- �ε��� ����
DROP INDEX IDX_EMPLOYEE_ENAME;

-- Ư�� )���� �ε��� : �ΰ� �̻��� �÷����� �����ϴ� �ε���
CREATE INDEX IDX_DEPT_COM
ON DEPARTMENT(DNAME, LOC);

-- Ư��) �Լ� �ε��� : �����̳� �Լ��� �����ؼ� ���� �ε���
CREATE INDEX IDX_EMP_ANNSAL
ON EMPLOYEE(SALARY*12);
