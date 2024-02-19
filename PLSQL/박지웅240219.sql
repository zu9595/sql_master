SET SERVEROUTPUT ON;

-- 2
declare
   type emp_record_type is record
    (depid employees.department_id%type,
     jid employees.first_name%type,
     sal employees.salary%type := 0,
     ysal employees.salary%type := 0);
     
    v_emp_info emp_record_type;
begin
    select department_id,
                job_id,
                salary,
                (salary + (nvl((salary*commission_pct),0)))*12 as ysal
                into v_emp_info
        from employees
        where employee_id = &eid;
        DBMS_OUTPUT.PUT(v_emp_info.depid || ', ');
        DBMS_OUTPUT.PUT(v_emp_info.jid || ', ');
        DBMS_OUTPUT.PUT(v_emp_info.sal || ', ');
        DBMS_OUTPUT.PUT_line(v_emp_info.ysal);
end;
/

-- 3
declare
    v_years employees.hire_date%type;
begin
    select hire_date
    into v_years
    from employees
    where employee_id = &eid;
    
    if v_years > to_date(20151231) then
        DBMS_OUTPUT.PUT_LINE('New employee');
    else
        DBMS_OUTPUT.PUT_LINE('Career employee');
    end if;
end;
/

-- 4
begin
    for x in 1..9 loop
        if mod(x, 2) <> 0 then
        for y in 1..9 loop
            DBMS_OUTPUT.PUT_LINE(x || ' x ' || y || ' = ' || x*y);
        end loop;
        end if;
    end loop;
end;
/

-- 5
declare
    cursor dep_cursor is
        select employee_id, last_name, salary
        from employees
        where department_id = &did;
begin
    for rec in dep_cursor loop
            DBMS_OUTPUT.PUT(rec.employee_id || ', ');
            DBMS_OUTPUT.PUT(rec.last_name || ', ');
            DBMS_OUTPUT.PUT_LINE(rec.salary);
    end loop;
end;
/

-- 6
drop PROCEDURE upsal;
create PROCEDURE upsal
(p_eid in employees.employee_id%type,
 p_upsal in number)
is
    e_no_data exception;
begin
    update employees
    set salary = salary + (salary*(p_upsal/100))
    where employee_id = p_eid;
    
    if sql%rowcount = 0 then
        raise e_no_data;
    end if;
exception
    when e_no_data then
        DBMS_OUTPUT.PUT_LINE('No search employee!!');
end;
/

-- 7
create or replace function agemale
(p_code in number)
return varchar2
is
    v_age number(38,0);
    v_male varchar2(1000);
begin
    if substr(p_code, 7, 1) = '3' or substr(p_code, 7, 1) = '4' and to_date(to_char(sysdate, 'MMdd')) < to_date(substr(p_code, 3, 4)) then 
        v_age := to_char(sysdate, 'yy') - substr(p_code, 1,2);
    end if;
    if substr(p_code, 7, 1) = '3' then
        v_male := '남';
    elsif substr(p_code, 7, 1) = '4' then
        v_male := '여';
    end if;
    RETURN '나이 : ' || v_age || ' 성별 : ' || v_male;
end;
/
--begin
--DBMS_OUTPUT.PUT_LINE(to_date(to_char(sysdate, 'MMdd')) - to_date(to_char(substr('021102', 3, 4), 'MMdd'));
--end;
/
execute DBMS_OUTPUT.PUT_LINE(agemale(0211023234567));

-- 8
create or replace function workyear
(p_eid in employees.employee_id%type)
return varchar2
is
    v_ehd employees.hire_date%type;
    v_workyear varchar2(1000);
begin
    select hire_date
    into v_ehd
    from employees
    where employee_id = p_eid;
    
    v_workyear := to_number(to_char(sysdate, 'yy')) - to_number(to_char(v_ehd, 'yy'));
    return v_workyear;
end;
/
execute DBMS_OUTPUT.put_line(workyear(100) || '년');

-- 9
create or replace function magsec
(p_dname in departments.department_name%type)
return varchar2
is

begin
    select last_name
    from departments d join employees e
    on(d.manager_id = e.employee_id)
    where department_name = p_dname;
    return ;
end;
/
-- 10
select name, text
from user_source
where type in('PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY');