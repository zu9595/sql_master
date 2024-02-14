
declare
    v_deptno departments.department_id%type;
    v_comm employees.commission_pct%type := .1;
begin
    select department_id
    into v_deptno
    from employees
    where employee_id = &�����ȣ;
    
    insert into employees(employee_id, last_name, email, hire_date, job_id, department_id)
    values(1000, 'Hong', 'hkd@google.com', sysdate, 'IT_PROG', v_deptno);
    
    update employees
    set salary = (nvl(salary, 0) + 10000) * v_comm
    where employee_id = 1000;
end;
/
rollback;
select *
from employees
where employee_id = 1000;

begin
    delete from employees
    where employee_id = 1000;
    
    update employees
    set salary = salary * 1.1
    where employee_id = 0;
    
    if sql%rowcount = 0 then
        DBMS_OUTPUT.PUT_LINE('���������� �������� �ʾҽ��ϴ�.');
    end if;
end;
/

/*
1.
�����ȣ�� �Է�(ġȯ�������&)�� ���
�����ȣ, ����̸�, �μ��̸�
�� ����ϴ� PL/SQL�� �ۼ��Ͻÿ�
*/
declare
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_dname departments.department_name%type;
begin
    select employee_id, last_name, department_name
    into v_eid, v_ename, v_dname
    from employees e
    right OUTER join departments d
    on(e.department_id = d.department_id)
    where employee_id = &���;
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('�μ��̸� : ' || v_dname);
end;
/
--2��° ���
declare
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_did departments.department_id%type;
    v_dname departments.department_name%type;
begin
    select e.employee_id, e.last_name, d.department_id
    into v_eid, v_ename, v_did
    from employees e
    join departments d
    on(e.department_id = d.department_id)
    where employee_id = &���;
    
    select department_name
    into v_dname
    from departments
    where department_id = v_did;
    
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('�μ��̸� : ' || v_dname);
end;
/
/*
2.
�����ȣ�� �Է�(ġȯ�������&)�� ���
����̸�, �޿�, ����->(�޿�*12+(nvl(�޿�,0)*nvl(Ŀ�̼��ۼ�Ʈ,0)*12)
�� ����ϴ� PL/SQL�� �ۼ��Ͻÿ�.
*/
declare
    v_ename     employees.last_name%type;
    v_sal       employees.salary%type;
    v_salyear   v_sal%type;
begin
    select last_name, salary, (salary*12+(nvl(salary,0)*nvl(commission_pct,0)*12)) as salyear
    into v_ename, v_sal, v_salyear
    from employees
    where employee_id = &�����ȣ;
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('���� : ' || v_salyear);
end;
/
--2��° ���
declare
    v_ename     employees.last_name%type;
    v_sal       employees.salary%type;
    v_comm      employees.commission_pct%type;
    v_salyear   v_sal%type;
begin
    select last_name, salary, commission_pct
    into v_ename, v_sal, v_comm
    from employees
    where employee_id = &�����ȣ;
    
    v_salyear := (v_sal*12+(nvl(v_sal,0)*nvl(v_comm,0)*12));
    
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('���� : ' || v_salyear);
end;
/

create table test_employees
as
    select *
    from employees;

-- �⺻ IF ��
begin
    delete from test_employees
    where employee_id = &���;
    
    if sql%rowcount = 0 then
        DBMS_OUTPUT.PUT_LINE('���������� �������� �ʾҽ��ϴ�.');
        DBMS_OUTPUT.PUT_LINE('�����ȣ�� Ȯ�����ּ���.');
    end if;
end;
/

-- if ~ else �� : �ϳ��� ���ǽ�, ����� ���� ���� ����
declare
    v_result number(4,0);
begin
    select count(employee_id)
    into v_result
    from employees
    where manager_id = &�����ȣ;
    
    if v_result = 0 then
        dbms_output.put_line('�Ϲ� ����Դϴ�.');
    else
        DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
    end if;
end;
/

-- if ~ elsif ~ else �� : ���� ���ǽ��� �ʿ�, ���� ���ó��
-- ������ ���ϴ� ����
select employee_id, trunc(months_between(sysdate, hire_date)/12)
from employees;

declare
    v_hyear number(4,0);
begin
    select trunc(months_between(sysdate, hire_date)/12)
    into v_hyear
    from employees
    where employee_id = &�����ȣ;
    
    if v_hyear < 5 then
        dbms_output.put_line('�Ի��� �� 5�� �̸�');
    elsif v_hyear < 10 then
        dbms_output.put_line('�Ի��� �� 5�� �̻� 10�� �̸�');
    elsif v_hyear < 15 then
        dbms_output.put_line('�Ի��� �� 10�� �̻� 15�� �̸�');
    elsif v_hyear < 20 then
        dbms_output.put_line('�Ի��� �� 15�� �̻� 20�� �̸�');
    else
        dbms_output.put_line('�Ի��� �� 20�� �̻�');
    end if;
end;
/

/*
3-1.
�����ȣ�� �Է�(ġȯ�������&)�� ���
�Ի����� 2015�� ����(2015�� ����)�̸� 'New employee' ���
2015�� �����̸� 'Career employee' ���
*/
declare
    v_eears employees.hire_date%type;
begin
    select hire_date
    into v_eears
    from employees
    where employee_id = &���;
    
    if v_eears > to_date(20141231) then
        dbms_output.put_line('New employee');
    else
        dbms_output.put_line('Career employee');
    end if;
end;
/

/*
3-2.
�����ȣ�� �Է�(ġȯ�������&)�� ���
�Ի����� 2015�� ����(2015�� ����)�̸� 'New employee' ���
2015�� �����̸� 'Career employee' ���
��, DBMS_OUTPUT.PUT_LINE ~ �� �ѹ��� ���
*/
declare
    v_eears employees.hire_date%type;
    v_word varchar2(1000); -- := 'Career employee';
begin
    select hire_date
    into v_eears
    from employees
    where employee_id = &���;
    
    if to_char(v_eears, 'yyyy') > '2014' then
        v_word := 'New employee';
    else
        v_word := 'Career employee';
    end if;
    dbms_output.put_line(v_word);
end;
/

/*
4.
�޿���  5000�����̸� 20% �λ�� �޿�
�޿��� 10000�����̸� 15% �λ�� �޿�
�޿��� 15000�����̸� 10% �λ�� �޿�
�޿��� 15001�̻��̸� �޿� �λ����

�����ȣ�� �Է�(ġȯ����)�ϸ�
����̸�, �޿�, �λ�� �޿��� ��µǵ��� PL/SQL ����� �����Ͻÿ�
*/
declare
    v_sal employees.salary%type;
    v_upsal v_sal%type;
    v_com number(3,0);
    v_ename employees.last_name%type;
begin
    select last_name, salary
    into v_ename, v_sal
    from employees
    where employee_id = &���;
    
    if v_sal <= 5000 then
        v_com := 20;
    elsif v_sal <= 10000 then
        v_com := 15;
    elsif v_sal <= 15000 then
        v_com := 10;
    else
        v_com := 0;
    end if;
    v_upsal := v_sal + (v_sal * v_com/100);
    dbms_output.put_line('����̸� : ' || v_ename);
    dbms_output.put_line('�޿� : ' || v_sal);
    dbms_output.put_line('�λ�� �޿� : ' || v_upsal);
end;
/

-- �⺻ LOOP��
declare
    v_num number(38) := 0;
begin
    loop
        v_num := v_num + 1;
        DBMS_OUTPUT.PUT_LINE(v_num);
        exit when v_num > 10; -- ���� ����
    end loop;
end;
/

-- WHILE LOOP��
declare
    v_num number(38,0) := 1;
begin
    while v_num <= 5 loop -- �ݺ�����
        DBMS_OUTPUT.PUT_LINE(v_num);
        v_num := v_num + 1;
    end loop;
end;
/

-- ���� : 1���� 10���� �������� ��
-- 1) �⺻ loop
declare
    v_sum number(38,0) := 0;
    v_num number(38,0) := 1;
begin
    loop
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
        exit when v_num > 10;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_sum);
end;
/
-- 2) while loop
declare
    v_sum number(38,0) := 0;
    v_num number(38,0) := 1;
begin
    while v_num <= 10 loop -- �ݺ�����
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_sum);
end;
/

-- FOR LOOP
begin
    for idx in reverse -10..5 loop -- reverse : �ִ밪���� �о��, (-10/5)..(4/2)�� ���� ���굵 ����
        if mod(idx, 2) <> 0 then -- mod : ������ ������, <> : PLSQL���� !=��� ���
            DBMS_OUTPUT.PUT_LINE(idx);
        end if;
    end loop;
end;
/

-- ���ǻ��� 2) ī����(counter)
declare
    v_num number(2,0) := 0;
begin
    DBMS_OUTPUT.PUT_LINE(v_num);
    v_num := v_num * 2;
    DBMS_OUTPUT.PUT_LINE(v_num);
    DBMS_OUTPUT.PUT_LINE('==============================');
    for v_num in 1..10 loop
        -- v_num := v_num * 2; x
        dbms_output.put_line(v_num);
    end loop;
    dbms_output.put_line(v_num);
end;
/

-- ���� : 1���� 10���� �������� ��
-- 3) FOR LOOP
declare
    -- ������ : 1 ~ 10 => FOR LOOP�� ī���ͷ� ó��
    -- �հ�
    v_total number(2, 0) := 0;
begin
    for i in 1..10 loop
        v_total := v_total + i;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_total);
end;
/

/*
1. ������ ���� ��µǵ��� �Ͻÿ�. -- loop�� �������� ����
*
**
***
****
*****

*/

declare
    v_stars varchar2(5):= '';
    v_idx number(1,0) := 0;
begin
    loop
        v_idx := v_idx + 1;
        v_stars := v_stars + to_char('*');
        DBMS_OUTPUT.PUT_LINE(v_stars);
        exit when v_idx >= 5;
    end loop;
end;
/