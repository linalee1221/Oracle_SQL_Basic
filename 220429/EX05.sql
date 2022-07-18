-- ����Ŭ �����Լ�
-- 1) UPPER(���ڿ�) / LOWER(���ڿ�) / INITCAP(���ڿ�)
SELECT 'Oracle Mania',
        UPPER('Oracle Mania') AS �빮��,
        LOWER('Oracle Mania') AS �ҹ���,
        INITCAP('Oracle Mania') AS "ù ���ڸ� �빮��"
FROM DUAL;

-- ���� ���̺�
SELECT ENAME, LOWER(ENAME), JOB, INITCAP(JOB) FROM EMPLOYEE;

-- SCOTT ��� �˻��ϱ�
-- �÷��� �����͸� �ϰ� �ҹ��ڷ� �����ؼ� �� �����ϳ� ������ ���� �ʴ�.
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE LOWER(ENAME) = 'scott';

-- 2) ���ڱ��̸� ��ȯ�ϴ� �Լ�
SELECT LENGTH('OracleMania'), LENGTH('����Ŭ�ŴϾ�') FROM DUAL;

-- 3) ���� ���� �Լ�
-- CONCAT : ������ ���� �����ϴ� �Լ�
-- ����) ���ڿ� || ���ڿ� : ���ڿ� ���̱� ����
SELECT 'Oracle', 'mania', CONCAT('Oracle', 'mania'), 'Oracle' || 'mania' FROM DUAL;

-- 4) ���� ���� �Լ�
-- ���ڿ� �ڸ���
-- SUBSTR(����÷�(����), ������ġ, ����)
SELECT SUBSTR('Oracle mania', 4, 3) FROM DUAL;

-- ����12) �̸��� N���� ������ ��� ���
-- ������̺� : EMPLOYEE
SELECT ENAME FROM EMPLOYEE WHERE SUBSTR(ENAME, -1, 1) = 'N';

-- ����13) 87�⵵�� �Ի��� ��� ���
SELECT * FROM EMPLOYEE WHERE SUBSTR(HIREDATE, 1, 2) = '87';

-- SUBSTRB(����÷�(����), ������ġ, ����) : ���� BYTE �������� �߶� ���
-- ����(1BYTE) : SUBSTR / SUBSTRB ����� ����
-- �ѱ�(3BYTE) : SUBSTR / SUBSTRB ����� Ʋ��

-- 5) ���ڿ����� ��� ���ڸ� ã�� �ε��� ��ȣ�� ��ȯ
-- ����Ŭ������ �ε�����ȣ�� 1���� ������
-- INSTR(�뼺�÷�(����), ã�� ����, ���� ��ġ, ���° �߰�)
SELECT INSTR('Oracle mania', 'a') FROM DUAL;

-- ��� ���ڿ� �� 'A'�� ��ġ�� ã�� ���ڿ��� 5��° ��ġ���� �����ؼ� ã��
-- �ι�° 'A'�� ã���� ���� �ε��� ��ȣ�� ��ȯ��
SELECT INSTR('Oracle mania', 'a', 5, 2) FROM DUAL;

-- ����14) ��� �������� INSTR�� ����Ͽ� �̸� ����° �ڸ��� R�� ����� �˻��ϴ� ������ �ۼ�
SELECT * FROM EMPLOYEE WHERE INSTR(ENAME, 'R', 3, 1) = 3;
-- �� ������� ����. WHERE ���� �����Լ��� ���̸� ������ �� �������� ����.