-- 2) Oracle�� �����ϰ� �ְ� �̸��� �������� �ʴ� ���
DECLARE
    e_emps_remaining EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_emps_remaining, -02292);
BEGIN
    DELETE FROM departments
    WHERE department_id = &�μ���ȣ;
    
EXCEPTION
    WHEN e_emps_remaining THEN
        DBMS_OUTPUT.PUT_LINE('�ٸ� ���̺��� ����ϰ� �ֽ��ϴ�.');
END;
/

-- 3) ����ڰ� �����ϴ� ���ܻ���
DECLARE
    e_emp_del_fail EXCEPTION;
BEGIN
    DELETE FROM test_employees
    WHERE employee_id = &�����ȣ;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE e_emp_del_fail;
    END IF;
EXCEPTION
    WHEN e_emp_del_fail THEN
        DBMS_OUTPUT.PUT_LINE('�ش� ����� �������� �ʽ��ϴ�.');
END;
/

-- 1) test employees ���̺��� ����Ͽ� ���õ� ����� �����ϴ� PL/SQL�ۼ�
-- ����1) ġȯ���� ���
-- ����2) ����� �������� �ʴ� ��� '�ش� ����� �������� �ʽ��ϴ�.'��� �޼����� ���
-- => ����� ���� ����
