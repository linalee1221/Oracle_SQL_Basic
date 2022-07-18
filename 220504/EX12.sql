-- ��(VIEW) �ǽ�
-- ��(VIEW) : ���� ���̺�(���̺��� ������ �Ҵ�Ǿ� ��ũ�� ����ǳ� �������̺��� ���� ������ ���� ����)
-- �信 ����� �� : SQL��(SELECT��)
-- ��)
-- VIEW ���� ���� �ֱ�(SYS, SYSTEM(������) ������ ����) : CMDâ���� ������ ���� ��ɾ� �ۼ� 
-- grant create any view to scott; GRANT ���� TO ����;
-- VIEW ���� ���� ����(SYS, SYSTEM(������) ������ ����) : CMDâ���� ������ ���� ��ɾ� �ۼ� 
-- revoke create any view from scott; REVOKE ���� FROM ����;
CREATE OR REPLACE VIEW VW_EMP_JOB AS
SELECT ENO, ENAME, DNO, JOB
FROM EMPLOYEE
WHERE JOB LIKE 'SALES%';

SELECT * FROM VW_EMP_JOB;


-- ��� ���̺��� �޿������� ���ԵǾ� ����, ��ܺ�(ex.�޿�) ���̺��� �����ڿ��� �����ϰ� ���� ���� ��
CREATE VIEW V_EMP_SAMPLE AS
SELECT ENO, ENAME, JOB, MANAGER, DNO
FROM EMPLOYEE;

-- �������) ������ ������ �� ����� ���� ������ ��ȸ�ϴ� ��ųʸ�
SELECT VIEW_NAME, TEXT FROM USER_VIEWS;

-- �׷��Լ��� �� SELECT ���� ��(VIEW)�� �����
CREATE OR REPLACE VIEW VW_EMP_SALARY AS
SELECT DNO, SUM(SALARY) AS "�޿��Ѿ�", TRUNC(AVG(SALARY)) AS "��ձ޿�"
FROM EMPLOYEE GROUP BY DNO; -- �����߻�(SELECT�� �׷��Լ��� �ִ� �÷��� ��Ī�� �����ؾ� ��)

-- �� �����ϱ�
-- �� �䰡 ����� Ȯ���ϱ�
SELECT * FROM USER_VIEWS;

-- �����ϱ�
DROP VIEW VW_EMP_JOB;
DROP VIEW V_EMP_SAMPLE;
DROP VIEW VW_EMP_SALARY;

