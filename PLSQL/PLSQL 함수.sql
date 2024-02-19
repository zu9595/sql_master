-- FUNCTION
CREATE or REPLACE FUNCTION test_fun
( p_msg in varchar2)
RETURN VARCHAR2
IS
    -- 선언부
BEGIN
    RETURN p_msg;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN '데이터가 존재하지 않습니다.';
END;
/

DECLARE
    v_result VARCHAR2(1000);
BEGIN
    v_result := test_fun('테스트');
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/
select test_fun('select문에서 호출')
from dual;

select *
from user_source
where type in ('PROCEDURE');

-- 더하기
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

-- 사원번호를 기준으로 직속상사 이름을 출력
select m.last_name
from employees e join employees m
on(e.manager_id = m.employee_id)
where e.employee_id = 149;

create or REPLACE FUNCTION get_mgr
(p_eid employees. employee_id%type)
return varchar2 --반환할 결과값의 타입
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
        return '직속 상사가 존재하지 않습니다.';
end;
/
select employee_id, last_name, get_mgr(employee_id) as manager
from employees;

/*
1.
사원번호를 입력하면 
last_name + first_name 이 출력되는 
y_yedam 함수를 생성하시오.

실행) EXECUTE DBMS_OUTPUT.PUT_LINE(y_yedam(174))
출력 예)  Abel Ellen

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
사원번호를 입력할 경우 다음 조건을 만족하는 결과가 출력되는 ydinc 함수를 생성하시오.
- 급여가 5000 이하이면 20% 인상된 급여 출력
- 급여가 10000 이하이면 15% 인상된 급여 출력
- 급여가 20000 이하이면 10% 인상된 급여 출력
- 급여가 20000 이상이면 급여 그대로 출력
실행) SELECT last_name, salary, YDINC(employee_id)
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
사원번호를 입력하면 해당 사원의 연봉이 출력되는 yd_func 함수를 생성하시오.
->연봉계산 : (급여+(급여*인센티브퍼센트))*12
실행) SELECT last_name, salary, YD_FUNC(employee_id)
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
예제와 같이 출력되는 subname 함수를 작성하시오.
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