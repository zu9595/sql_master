-- FUNCTION
CREATE or REPLACE FUNCTION test_fun
( p_msg in varchar2)
RETURN VARCHAR2
IS
    -- �����
BEGIN
    RETURN p_msg;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN '�����Ͱ� �������� �ʽ��ϴ�.';
END;
/

DECLARE
    v_result VARCHAR2(1000);
BEGIN
    v_result := test_fun('�׽�Ʈ');
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/
select test_fun('select������ ȣ��')
from dual;

select *
from user_source
where type in ('PROCEDURE');

-- ���ϱ�
create or REPLACE function y_sum
( p_x in number,
  p_y in number)
return number
is
    v_result number;
begin
    v_result := p_x + p_y;
    return v_result;
end;
/
select y_sum(100, 200)
from dual;

-- �����ȣ�� �������� ���ӻ�� �̸��� ���
select m.last_name
from employees e join employees m
on(e.manager_id = m.employee_id)
where e.employee_id = 149;

create or REPLACE FUNCTION get_mgr
(p_eid employees. employee_id%type)
return varchar2 --��ȯ�� ������� Ÿ��
is
    v_mgr_name employees.last_name%type;
begin
    select m.last_name
    into v_mgr_name
    from employees e join employees m
    on(e.manager_id = m.employee_id)
    where e.employee_id = p_eid;
    
    return v_mgr_name;
EXCEPTION
    when NO_DATA_FOUND then
        return '���� ��簡 �������� �ʽ��ϴ�.';
end;
/
select employee_id, last_name, get_mgr(employee_id) as manager
from employees;

/*
1.
�����ȣ�� �Է��ϸ� 
last_name + first_name �� ��µǴ� 
y_yedam �Լ��� �����Ͻÿ�.

����) EXECUTE DBMS_OUTPUT.PUT_LINE(y_yedam(174))
��� ��)  Abel Ellen

SELECT employee_id, y_yedam(employee_id)
FROM   employees;
*/
create or REPLACE function y_yedam
(p_eid in employees.employee_id%type)
return varchar2
is

    v_last employees.last_name%type;
    v_first employees.first_name%type;
begin
    select last_name, first_name
    into v_last, v_first
    from employees
    where employee_id = p_eid;
    
    return v_last || ' ' || v_first;
end;
/
EXECUTE DBMS_OUTPUT.PUT_LINE(y_yedam(174));
SELECT employee_id, y_yedam(employee_id)
FROM   employees;





/*
2.
�����ȣ�� �Է��� ��� ���� ������ �����ϴ� ����� ��µǴ� ydinc �Լ��� �����Ͻÿ�.
- �޿��� 5000 �����̸� 20% �λ�� �޿� ���
- �޿��� 10000 �����̸� 15% �λ�� �޿� ���
- �޿��� 20000 �����̸� 10% �λ�� �޿� ���
- �޿��� 20000 �̻��̸� �޿� �״�� ���
����) SELECT last_name, salary, YDINC(employee_id)
     FROM   employees;
*/
create or REPLACE function ydinc
(p_eid in employees.employee_id%type)
return number
is
    v_sal employees.salary%type;
begin
    select case
        when salary <= 5000 then
            salary * 1.20
        when salary <= 10000 then
            salary * 1.15
        when salary <= 20000 then
            salary * 1.10
        else
            salary
        end
    into v_sal
    from employees
    where employee_id = p_eid;
    
--    if v_sal <= 5000 then
--        v_sal := v_sal * 1.20;
--    elsif v_sal <= 10000 then
--        v_sal := v_sal * 1.15;
--    elsif v_sal <= 20000 then
--        v_sal := v_sal * 1.10;  
--    end if;
    return v_sal;
end;
/
SELECT last_name, salary, YDINC(employee_id)
FROM   employees;





/*
3.
�����ȣ�� �Է��ϸ� �ش� ����� ������ ��µǴ� yd_func �Լ��� �����Ͻÿ�.
->������� : (�޿�+(�޿�*�μ�Ƽ���ۼ�Ʈ))*12
����) SELECT last_name, salary, YD_FUNC(employee_id)
     FROM   employees;   
*/
create or REPLACE function yd_func
(p_eid in employees.employee_id%type)
return number
is
    v_ysal employees.salary%type;
begin
    select (salary+(nvl(salary*commission_pct,0)))*12
    into v_ysal
    from employees
    where employee_id = p_eid;
    
    return v_ysal;
end;
/
SELECT last_name, salary, YD_FUNC(employee_id), commission_pct
FROM   employees;
/*
4. 
SELECT last_name, subname(last_name)
FROM   employees;

LAST_NAME     SUBNAME(LA
------------ ------------
King         K***
Smith        S****
...
������ ���� ��µǴ� subname �Լ��� �ۼ��Ͻÿ�.
*/
create or REPLACE function subname
(p_lname in employees.last_name%type)
return varchar2
is
    v_word employees.last_name%type;
begin
    return rpad(substr(p_lname,1,1), length(p_lname), '*');
end;
/
SELECT last_name, subname(last_name)
FROM   employees;