-- PROCEDURE : ���ν��� �ʿ� ���, �����Ұ�(DROP�̳� OR REPLACE ���)
CREATE PROCEDURE test_pro
IS
-- ����� : ���ο��� ����ϴ� ����, Ŀ��, Ÿ��, ����
    v_msg VARCHAR2(1000) := 'Execute Procedure';
BEGIN
    DELETE FROM test_employees
    WHERE department_id = 50;
    
    DBMS_OUTPUT.PUT_LINE(v_msg);
EXCEPTION
    WHEN INVALID_CURSOR THEN
        DBMS_OUTPUT.PUT_LINE('����� �� ���� Ŀ���Դϴ�.');
END;
/

-- ����1)
BEGIN
    test_pro; -- ������ ������ ���ν����� �ν�
END;
/
-- ����2)
EXECUTE test_pro; -- ���� ��ɾ�

-- IN : PROCEDURE ���ο��� ����� �ν�
DROP PROCEDURE raise_salary;

CREATE PROCEDURE raise_salary
(p_eid IN employees. employee_id%TYPE)
IS

BEGIN
    UPDATE employees
    SET salary = salary * 1.1
    WHERE employee_id = p_eid;
END;
/

DECLARE
    v_first NUMBER(3,0) := 100;
    v_second CONSTANT NUMBER(3,0) := 149;
BEGIN
    raise_salary(103);
    raise_salary((v_first+10));
    raise_salary(v_second);
    raise_salary(v_first);
END;
/
SELECT employee_id, salary
from employees;

-- OUT : PROCEDURE ���ο��� �ʱ�ȭ���� ���� ����
CREATE PROCEDURE test_p_out
(p_num IN NUMBER,
 p_result OUT NUMBER)
IS
    v_sum NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('IN : ' || p_num);
    DBMS_OUTPUT.PUT_LINE('OUT : ' || p_result);
    -- p_result := 10;
    v_sum := p_num + p_result;
    p_result := v_sum;
END;
/

DECLARE
    v_result NUMBER(4,0) := 1234;
BEGIN
    DBMS_OUTPUT.PUT_LINE('1) result : ' || v_result);
    test_p_out(1000, v_result);
    DBMS_OUTPUT.PUT_LINE('2) result : ' || v_result);
END;
/

CREATE PROCEDURE select_emp
(p_eid in employees.employee_id%TYPE,
 p_ename OUT employees.last_name%type,
 p_sal OUT employees.salary%type,
 p_comm OUT employees.commission_pct%type)
IS

BEGIN
    SELECT last_name, salary, nvl(commission_pct,0)
    INTO p_ename, p_sal, p_comm
    from employees
    where employee_id = p_eid;
end;
/

declare
    v_name varchar2(100 char);
    v_sal number;
    v_comm number;
    
    v_eid number := &�����ȣ;
begin
    select_emp(v_eid, v_name, v_sal, v_comm);
    
    DBMS_OUTPUT.PUT('�����ȣ : ' || v_eid);
    DBMS_OUTPUT.PUT(', ����̸� : ' || v_name);
    DBMS_OUTPUT.PUT(', �޿� : ' || v_sal);
    DBMS_OUTPUT.PUT(', Ŀ�̼� : ' || v_comm);
end;
/

-- IN OUT �Ű�����
-- '01012341234' => '010-1234-1234'
CREATE PROCEDURE format_phone
(p_phone_no in out varchar2)
is

BEGIN
    p_phone_no := substr(p_phone_no, 1, 3)
                || '-' || substr(p_phone_no, 4, 4)
                || '-' || substr(p_phone_no, 8);
END;
/

declare
    v_ph_no varchar2(100) := '01012341234';
begin
    DBMS_OUTPUT.PUT_LINE('1) ' || v_ph_no);
    format_phone(v_ph_no);
    DBMS_OUTPUT.PUT_LINE('2) ' || v_ph_no);
END;
/

create table var_pk_tbl
(
    no varchar2(1000) primary key,
    name varchar2(4000) default 'anony'
);
select no, name
from var_pk_tbl;
'TEMP240215001' -- TEMP + yyMMdd + ����(3�ڸ�)

SELECT NVL(MAX(employee_id),0) + 1
from employees;

select 'TEMP' || to_char(240215, 'yyMMdd') || lpad(nvl(max(substr(no, -3)),0) +1,3,'0')
from var_pk_tbl;
--where substr(no, 5, 6) = to_char(240215, 'yyMMdd')

/*
1.
�ֹε�Ϲ�ȣ�� �Է��ϸ� 
������ ���� ��µǵ��� yedam_ju ���ν����� �ۼ��Ͻÿ�.

EXECUTE yedam_ju(9501011667777)
EXECUTE yedam_ju(1511013689977)

  -> 950101-1******
*/

create or replace procedure yedam_ju
(p_num in varchar2)
is
    v_result varchar2(100);
BEGIN
    v_result := substr(p_num, 1, 6)
                || '-' || rpad(substr(p_num, 7, 1), 7, '*');
    DBMS_output.put_line(v_result);
END;
/

EXECUTE yedam_ju(9501011667777);
EXECUTE yedam_ju(1511013687777);

/*
2.
�����ȣ�� �Է��� ���
�����ϴ� TEST_PRO ���ν����� �����Ͻÿ�.
��, �ش����� ���� ��� "�ش����� �����ϴ�." ���
��) EXECUTE TEST_PRO(176)
*/

/*
3.
������ ���� PL/SQL ����� ������ ��� 
�����ȣ�� �Է��� ��� ����� �̸�(last_name)�� ù��° ���ڸ� �����ϰ��
'*'�� ��µǵ��� yedam_emp ���ν����� �����Ͻÿ�.

����) EXECUTE yedam_emp(176)
������) TAYLOR -> T*****  <- �̸� ũ�⸸ŭ ��ǥ(*) ���
*/

/*
4.
�μ���ȣ�� �Է��� ��� 
�ش�μ��� �ٹ��ϴ� ����� �����ȣ, ����̸�(last_name)�� ����ϴ� get_emp ���ν����� �����Ͻÿ�. 
(cursor ����ؾ� ��)
��, ����� ���� ��� "�ش� �μ����� ����� �����ϴ�."��� ���(exception ���)
����) EXECUTE get_emp(30)
*/

/*
5.
�������� ���, �޿� ����ġ�� �Է��ϸ� Employees���̺� ���� ����� �޿��� ������ �� �ִ� y_update ���ν����� �ۼ��ϼ���. 
���� �Է��� ����� ���� ��쿡�� ��No search employee!!����� �޽����� ����ϼ���.(����ó��)
����) EXECUTE y_update(200, 10)
*/