-- �������� : ��(VIEW) �ǽ�
-- 1) 20�� �μ��� �Ҽ��� ����� �����ȣ�� �̸��� �μ���ȣ�� ����ϴ� VIEW ����
CREATE OR REPLACE VIEW VW_EMP_DNO AS
SELECT ENO, ENAME, DNO FROM EMPLOYEE
WHERE DNO = 20;

-- 2) �̹� �����Ǿ� �ִ� ��� �信 ���� �޿��� �߰� ����ϵ��� ����
CREATE OR REPLACE VIEW VW_EMP_DNO AS
SELECT ENO, ENAME, DNO, SALARY FROM EMPLOYEE
WHERE DNO = 20;