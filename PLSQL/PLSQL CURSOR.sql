set serveroutput on

-- CURSOR : SELECT�� ������ ���� ���� �ϳ��� �о� ����
-- FETCH�� �׻� 1����� ������ ����� ���������� �����Ͱ� �̵�
-- �⺻������ ���� ����Ű�� �����Ͱ� �����ϰ� �����Ƿ� ������ ���� ������ �о��� �� ������ ����
DECLARE
    -- Ŀ���� ����
    CURSOR emp_cursor IS
        SELECT employee_id, last_name 
        FROM employees;
        -- WHERE employee_id = 0; --�����Ͱ� ��� ������ ������ �����Ƿ� ����
        
    -- Ŀ������ ���� �÷�����ŭ ����
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
BEGIN
    OPEN emp_cursor;
    
    FETCH emp_cursor INTO v_eid, v_ename; -- ù ����� Ŀ������ ���� �÷����� �ϴ� ������ ����
    
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);

    CLOSE emp_cursor;    
END;
/

DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, last_name, job_id
        FROM employees;
        
    v_emp_record emp_cursor%ROWTYPE; -- �� ��üŸ��
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_emp_record;
        EXIT WHEN emp_cursor%NOTFOUND; -- ���ο� �����Ͱ� �� �̻� ���� ��� TRUE��. ����.
        DBMS_OUTPUT.PUT(emp_cursor%ROWCOUNT || ', ');
        DBMS_OUTPUT.PUT_LINE(v_emp_record.last_name);
    END LOOP;
    CLOSE emp_cursor;
END;
/

DECLARE
    CURSOR emp_cursor IS
        SELECT *
        FROM employees;
    
    v_emp_record employees%ROWTYPE;
    
    TYPE emp_table_type IS TABLE OF employees%ROWTYPE
        INDEX BY PLS_INTEGER;
        
    v_emp_table emp_table_type;
BEGIN
    OPEN emp_cursor;
    
    LOOP
        FETCH emp_cursor INTO v_emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        v_emp_table(v_emp_record.employee_id) := v_emp_record;
    END LOOP;
    
    CLOSE emp_cursor;
    
    FOR eid IN v_emp_table.FIRST..v_emp_table.LAST LOOP
        IF v_emp_table.EXISTS(eid) THEN
            DBMS_OUTPUT.PUT(v_emp_table(eid).employee_id || ', ');
            DBMS_OUTPUT.PUT(v_emp_table(eid).last_name || ', ');
            DBMS_OUTPUT.PUT_line(v_emp_table(eid).hire_date);
        END IF;
    END LOOP;
END;
/

--
DECLARE
    CURSOR emp_dept_cursor IS
        SELECT employee_id, last_name, job_id
        FROM employees
        WHERE department_id = &�μ���ȣ;
        
    v_emp_info emp_dept_cursor%ROWTYPE;
BEGIN
    -- 1) �ش� �μ��� ���� ����� ������ ���
    -- 2) �ش� �μ��� ���� ����� ���� ��� '�ش� �μ��� �Ҽӵ� ������ �����ϴ�.'��� �޼��� ���
    OPEN emp_dept_cursor;
    
    LOOP
        FETCH emp_dept_cursor INTO v_emp_info;
        EXIT WHEN emp_dept_cursor%NOTFOUND;
        dbms_output.put_line(emp_dept_cursor%ROWCOUNT);
        dbms_output.put(v_emp_info.employee_id || ', ');
        dbms_output.put(v_emp_info.last_name || ', ');
        dbms_output.put_line(v_emp_info.job_id);
    END LOOP;
    dbms_output.put_line('�а� �� �� ' || emp_dept_cursor%ROWCOUNT);
    IF emp_dept_cursor%ROWCOUNT = 0 THEN
        dbms_output.put_line('�ش� �μ��� �Ҽӵ� ������ �����ϴ�.');
    END IF;
    CLOSE emp_dept_cursor;
END;
/

-- 1) ��� ����� �����ȣ, �̸�, �μ��̸� ���
DECLARE
    CURSOR emp_cursor is
        select employee_id, last_name, department_name
        from employees e
        left outer join departments d
        on(e.department_id = d.department_id);
        
    v_einfo emp_cursor%rowtype;
BEGIN
    open emp_cursor;
    loop
        fetch emp_cursor into v_einfo;
        exit when emp_cursor%notfound;

        DBMS_OUTPUT.PUT(v_einfo.employee_id || ', ');
        DBMS_OUTPUT.PUT(v_einfo.last_name || ', ');
        DBMS_OUTPUT.PUT_line(v_einfo.department_name);    
    end loop;
    close emp_cursor;
END;
/

-- 2) �μ���ȣ�� 50�̰ų� 80�� ������� ����̸�, �޿�, ���� ���
DECLARE
    cursor emp_cursor is
        select last_name, salary, commission_pct
        from employees
        where department_id IN(50, 80);
        
    v_einfo emp_cursor%rowtype;
    v_ysal number(10, 0);
BEGIN
    open emp_cursor;
    loop
        fetch emp_cursor into v_einfo;
        exit when emp_cursor%notfound;
        
        v_ysal := (v_einfo.salary*12) + (nvl(v_einfo.salary, 0) * nvl(v_einfo.commission_pct, 0) * 12);
        DBMS_OUTPUT.PUT(v_einfo.last_name || ', ');
        DBMS_OUTPUT.PUT(v_einfo.salary || ', ');
        DBMS_OUTPUT.PUT_line(v_ysal);
    end loop;
    close emp_cursor;
END;
/

-- Ŀ�� FOR LOOP
DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, last_name
        FROM employees
        WHERE employee_id = 0;
BEGIN
    FOR emp_record IN emp_cursor LOOP
        DBMS_OUTPUT.PUT('NO. ' || emp_cursor%ROWCOUNT);
        DBMS_OUTPUT.PUT(', �����ȣ : ' || emp_record.employee_id);
        DBMS_OUTPUT.PUT_line(', ����̸� : ' || emp_record.last_name);
    END LOOP; -- CLOSE;
    -- DBMS_OUTPUT.PUT_line('Total : ' || emp_cursor%ROWCOUNT);
    
    FOR dept_info IN (SELECT * FROM departments) LOOP
        DBMS_OUTPUT.PUT_line(', �μ���ȣ : ' || dept_info.department_id);
        DBMS_OUTPUT.PUT_line(', ����̸� : ' || dept_info);
    END LOOP;
END;
/
-- 1) ��� ����� �����ȣ, �̸�, �μ��̸� ���
DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, last_name, department_name
        from employees e
        left outer join departments d
        on(e.department_id = d.department_id);
BEGIN
    FOR emp_record IN emp_cursor LOOP
        DBMS_OUTPUT.PUT(emp_record.employee_id || ', ');
        DBMS_OUTPUT.PUT(emp_record.last_name || ', ');
        DBMS_OUTPUT.PUT_LINE(emp_record.department_name);
    END LOOP;
END;
/
-- 2) �μ���ȣ�� 50�̰ų� 80�� ������� ����̸�, �޿�, ���� ���
DECLARE
    CURSOR einfo_cursor IS
        SELECT last_name, salary, (salary*12) + (nvl(salary, 0) * nvl(commission_pct, 0) * 12) as ysal
        FROM employees
        WHERE department_id IN(50, 80);
BEGIN
    FOR einfo_record IN einfo_cursor LOOP
        DBMS_OUTPUT.PUT(einfo_record.last_name || ', ');
        DBMS_OUTPUT.PUT(einfo_record.salary || ', ');
        DBMS_OUTPUT.PUT_LINE(einfo_record.ysal);
    END LOOP;
END;
/

-- �Ű�����
DECLARE
    CURSOR emp_cursor(p_mgr employees.manager_id%TYPE)IS
        SELECT employee_id, last_name
        FROM employees
        WHERE manager_id = p_mgr;
        
    v_emp_info emp_cursor%ROWTYPE;
BEGIN
    -- �⺻
    OPEN emp_cursor(100);
    
    LOOP
        FETCH emp_cursor INTO v_emp_info;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT(v_emp_info.employee_id || ', ');
        DBMS_OUTPUT.PUT_LINE(v_emp_info.last_name);
    END LOOP;
    
    CLOSE emp_cursor;
    
    -- Ŀ�� FOR LOOP
    FOR emp_info IN emp_cursor(149) LOOP
        DBMS_OUTPUT.PUT(emp_info.employee_id || ', ');
        DBMS_OUTPUT.PUT_LINE(emp_info.last_name);
    END LOOP;
END;
/

/*
1.
���(employees) ���̺���
����� �����ȣ, ����̸�, �Ի翬����
���� ���ؿ� �°� ���� test01, test02�� �Է��Ͻÿ�.
�Ի�⵵�� 2015��(����) ���� �Ի��� ����� test01 ���̺� �Է�
�Ի�⵵�� 2015�� ���� �Ի��� ����� test02 ���̺� �Է�
*/
CREATE TABLE test01
AS
    SELECT employee_id, first_name, hire_date
    FROM employees
    WHERE employee_id = 0;
    
CREATE TABLE test02
AS
    SELECT employee_id, first_name, hire_date
    FROM employees
    WHERE employee_id = 0;

-- 1
DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, first_name, hire_date
        from employees;
    
    emp_record emp_cursor%ROWTYPE;
BEGIN
    OPEN emp_cursor;
    
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;
        --Ŀ���� ����Ű�� �� ���� �������� �����ϴ� �κ�
        IF TO_CHAR(emp_record.hire_date, 'yyyy') <= '2015' THEN
            INSERT INTO test01(employee_id, first_name, hire_date)
            VALUES(emp_record.employee_id, emp_record.first_name, emp_record.hire_date);
        ELSE
            INSERT INTO test02(employee_id, first_name, hire_date)
            VALUES(emp_record.employee_id, emp_record.first_name, emp_record.hire_date);
        END IF;
    END LOOP;
    CLOSE emp_cursor;
END;
/

-- 2
DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, first_name, hire_date
        from employees;
BEGIN
    FOR emp_record IN emp_cursor LOOP
        IF TO_CHAR(emp_record.hire_date, 'yyyy') <= '2015' THEN
            INSERT INTO test01(employee_id, first_name, hire_date)
            VALUES(emp_record.employee_id, emp_record.first_name, emp_record.hire_date);
        ELSE
            INSERT INTO test02(employee_id, first_name, hire_date)
            VALUES(emp_record.employee_id, emp_record.first_name, emp_record.hire_date);
        END IF;
    END LOOP;
END;
/

/*
2.
�μ���ȣ�� �Է��� ���(&ġȯ���� ���)
�ش��ϴ� �μ��� ����̸�, �Ի�����, �μ����� ����Ͻÿ�.
(��, cursor ���)
*/

DECLARE
    CURSOR emp_cursor IS
        SELECT last_name, hire_date, department_name
        from employees e
        left outer join departments d
        on(e.department_id = d.department_id)
        where d.department_id = &�μ���ȣ;
BEGIN
    FOR emp_record IN emp_cursor LOOP
        DBMS_OUTPUT.PUT(emp_record.last_name || ', ');
        DBMS_OUTPUT.PUT(emp_record.hire_date || ', ');
        DBMS_OUTPUT.PUT_LINE(emp_record.department_name);
    END LOOP;
END;
/

DECLARE
    CURSOR dept_cursor IS
        SELECT *
        FROM departments;
        
    CURSOR emp_cursor(p_dept_id departments.department_id%TYPE)IS
        SELECT last_name, hire_date, department_name
        from employees e
        left outer join departments d
        on(e.department_id = d.department_id)
        where d.department_id = p_dept_id;
        
    v_einfo emp_cursor%ROWTYPE;
BEGIN
    FOR dept_info IN dept_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('====== ���� �μ� ���� : ' || dept_info.department_name);
    
    OPEN emp_cursor(dept_info.department_id);
    
    LOOP
        FETCH emp_cursor INTO v_einfo;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT(v_einfo.last_name || ', ');
        DBMS_OUTPUT.PUT(v_einfo.hire_date || ', ');
        DBMS_OUTPUT.PUT_LINE(v_einfo.department_name);
    END LOOP;
    
    IF emp_cursor%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('���� �Ҽӵ� ����� �����ϴ�.');
    END IF;
    
    CLOSE emp_cursor;
    END LOOP;
END;
/