-- ��������� �ǽ�
-- SCOTT ���� ���� ���(���� ���ӵǾ� �ִ� ����) : ��(ROLE : ���� ���ѵ��� ��� ��Ƶ�)
-- CONNECT(���ӿ� ���õ� ���� ����)
-- RESOURCE(���̺�, ��, ���ν��� ���� ����)
-- DBA(����, DB���� ��, �ֻ��� ����)
-- SCOTT ���� ���� ��½�Ű�� : GRANT CONNECT, RESOURCE, DBA TO SCOTT;
--                                           GRANT CREATE USER TO SCOTT;

-- ���� ����
-- ����Ŭ �������� ���� : TABLESPACE
CREATE USER GUEST01 IDENTIFIED BY 1111
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;

-- ���� ����
-- CREATE TABLE : ���̺� ���� ����
-- CREATE VIEW : �� ���� ����
-- CREATE SEQUENCE : ������ ���� ����

-- ���Ѻο� ��ɾ�
-- GRANT ����[��] TO ������

-- ������� ��ɾ�
-- REVOKE ����[��] FROM ������

-- ���Ǿ� : ���̺� : SELECT * FROM SCOTT3.EMPLOYEE ��Ī���� �����ؼ� �̸��� �������� �� �ִ�

-- ��������
-- 1) KBS ����� ���� / ��ȣ 1234
-- DEFAULT TABLESPACE ���� USERS�� ���
-- TEMPORARY TABLESPACE ���� TEMP�� ���
CREATE USER KBS IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;

-- 2) 1������ ������ ������ CONNECT, RESOURCE ����[��]�� �ο�
