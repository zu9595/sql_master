-- 1) ����Ŭ�� �����ϰ� �ְ� �̸��� �����ϴ� ���

DECLARE
    v_ename employees.last_name%TYPE;
BEGIN
    -- ������ ���ϰ� �ƴ� ���߰� �Է� => TOO_MANY_ROWS ����
    SELECT last_name
    INTO   v_ename
    FROM   employees
    WHERE  department_id = &�μ���ȣ;
    
    DBMS_OUTPUT.PUT_LINE(v_ename);
EXCEPTION
    -- �� ����ó���� �ϳ��� ������
    -- WHEN ~ THEN : �ش� ���� �̸�
    -- �ϳ��� when�� �ϳ��� ���� ������ ó��
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �μ����� ���� ���� ����� �����մϴ�.');
        
    -- NO_DATA_FOUND ���� ó��
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �μ����� �ٹ��ϴ� ����� �������� �ʽ��ϴ�.');

    -- ��Ÿ ���� ó��(OTHERS)
    -- OTHERS�� ��� ���� �ñ�� �ȵ� => � ���� ������ �����ϰ� ������ �ʿ�
    -- �˰��ִ� �������� ���� ����ó�� / ��¥ �������� �ȵǴ� ��Ȳ���� OTHERS
    WHEN OTHERS THEN -- ���� WHEN�� ���������� ����, ������ ������
        DBMS_OUTPUT.PUT_LINE('��Ÿ ���ܰ� �߻��߽��ϴ�.');
        DBMS_OUTPUT.PUT_LINE('EXCEPTION���� ����Ǿ����ϴ�.');
END;
/

-- 2) ����Ŭ�� �����ϰ� �ְ� �̸��� �������� �ʴ� ���
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

-- ���� Ʈ�� �Լ�(SQLCODE, SQLERM)
DECLARE
    e_too_many EXCEPTION; -- ����� ���� ���� ����
    
    v_ex_code NUMBER;
    v_ex_msg VARCHAR2(1000);
    emp_info employees%ROWTYPE;
BEGIN
    SELECT *
    INTO emp_info
    FROM employees
    WHERE department_id = &�μ���ȣ;
    
    IF emp_info.salary < (emp_info.salary * emp_info.commission_pct + 10000) THEN -- ����Ŭ ������ �߻���ų ���ǹ�
        RAISE e_too_many; -- RAISE : ����Ŭ���� ����� ���� ������ �ν��ϰ� �����
    END IF;
EXCEPTION
    WHEN e_too_many THEN
        DBMS_OUTPUT.PUT_LINE('����� ���� ���� �߻�!');
    WHEN OTHERS THEN
        v_ex_code := SQLCODE;
        v_ex_msg := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('ORA ' || v_ex_code);
        DBMS_OUTPUT.PUT_LINE(' - ' || v_ex_msg);
END;
/
-- 1) test employees ���̺��� ����Ͽ� ���õ� ����� �����ϴ� PL/SQL�ۼ�
-- ����1) ġȯ���� ���
-- ����2) ����� �������� �ʴ� ��� '�ش� ����� �������� �ʽ��ϴ�.'��� �޼����� ���
-- => ����� ���� ���� ���

DECLARE
    e_empdel EXCEPTION;
    
BEGIN
    DELETE test_employees
    WHERE  employee_id = &�����ȣ;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE e_empdel;
    END IF;
    
EXCEPTION
    WHEN e_empdel THEN
        DBMS_OUTPUT.PUT_LINE('�ش� ����� �������� �ʽ��ϴ�.');
END;
/
