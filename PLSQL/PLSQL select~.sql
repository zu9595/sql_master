
declare
    v_deptno departments.department_id%type;
    v_comm employees.commission_pct%type := .1;
begin
    select department_id
    into v_deptno
    from employees
    where employee_id = &사원번호;
    
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
        DBMS_OUTPUT.PUT_LINE('정상적으로 삭제되지 않았습니다.');
    end if;
end;
/

/*
1.
사원번호를 입력(치환변수사용&)할 경우
사원번호, 사원이름, 부서이름
을 출력하는 PL/SQL을 작성하시오
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
    where employee_id = &사번;
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('부서이름 : ' || v_dname);
end;
/
--2번째 방법
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
    where employee_id = &사번;
    
    select department_name
    into v_dname
    from departments
    where department_id = v_did;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('부서이름 : ' || v_dname);
end;
/
/*
2.
사원번호를 입력(치환변수사용&)할 경우
사원이름, 급여, 연봉->(급여*12+(nvl(급여,0)*nvl(커미션퍼센트,0)*12)
을 출력하는 PL/SQL을 작성하시오.
*/
declare
    v_ename     employees.last_name%type;
    v_sal       employees.salary%type;
    v_salyear   v_sal%type;
begin
    select last_name, salary, (salary*12+(nvl(salary,0)*nvl(commission_pct,0)*12)) as salyear
    into v_ename, v_sal, v_salyear
    from employees
    where employee_id = &사원번호;
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('연봉 : ' || v_salyear);
end;
/
--2번째 방법
declare
    v_ename     employees.last_name%type;
    v_sal       employees.salary%type;
    v_comm      employees.commission_pct%type;
    v_salyear   v_sal%type;
begin
    select last_name, salary, commission_pct
    into v_ename, v_sal, v_comm
    from employees
    where employee_id = &사원번호;
    
    v_salyear := (v_sal*12+(nvl(v_sal,0)*nvl(v_comm,0)*12));
    
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('연봉 : ' || v_salyear);
end;
/

create table test_employees
as
    select *
    from employees;

-- 기본 IF 문
begin
    delete from test_employees
    where employee_id = &사번;
    
    if sql%rowcount = 0 then
        DBMS_OUTPUT.PUT_LINE('정상적으로 삭제되지 않았습니다.');
        DBMS_OUTPUT.PUT_LINE('사원번호를 확인해주세요.');
    end if;
end;
/

-- if ~ else 문 : 하나의 조건식, 결과는 참과 거짓 각각
declare
    v_result number(4,0);
begin
    select count(employee_id)
    into v_result
    from employees
    where manager_id = &사원번호;
    
    if v_result = 0 then
        dbms_output.put_line('일반 사원입니다.');
    else
        DBMS_OUTPUT.PUT_LINE('팀장입니다.');
    end if;
end;
/

-- if ~ elsif ~ else 문 : 다중 조건식이 필요, 각각 결과처리
-- 연차를 구하는 공식
select employee_id, trunc(months_between(sysdate, hire_date)/12)
from employees;

declare
    v_hyear number(4,0);
begin
    select trunc(months_between(sysdate, hire_date)/12)
    into v_hyear
    from employees
    where employee_id = &사원번호;
    
    if v_hyear < 5 then
        dbms_output.put_line('입사한 지 5년 미만');
    elsif v_hyear < 10 then
        dbms_output.put_line('입사한 지 5년 이상 10년 미만');
    elsif v_hyear < 15 then
        dbms_output.put_line('입사한 지 10년 이상 15년 미만');
    elsif v_hyear < 20 then
        dbms_output.put_line('입사한 지 15년 이상 20년 미만');
    else
        dbms_output.put_line('입사한 지 20년 이상');
    end if;
end;
/

/*
3-1.
사원번호를 입력(치환변수사용&)할 경우
입사일이 2015년 이후(2015년 포함)이면 'New employee' 출력
2015년 이전이면 'Career employee' 출력
*/
declare
    v_eears employees.hire_date%type;
begin
    select hire_date
    into v_eears
    from employees
    where employee_id = &사번;
    
    if v_eears > to_date(20141231) then
        dbms_output.put_line('New employee');
    else
        dbms_output.put_line('Career employee');
    end if;
end;
/

/*
3-2.
사원번호를 입력(치환변수사용&)할 경우
입사일이 2015년 이후(2015년 포함)이면 'New employee' 출력
2015년 이전이면 'Career employee' 출력
단, DBMS_OUTPUT.PUT_LINE ~ 는 한번만 사용
*/
declare
    v_eears employees.hire_date%type;
    v_word varchar2(1000); -- := 'Career employee';
begin
    select hire_date
    into v_eears
    from employees
    where employee_id = &사번;
    
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
급여가  5000이하이면 20% 인상된 급여
급여가 10000이하이면 15% 인상된 급여
급여가 15000이하이면 10% 인상된 급여
급여가 15001이상이면 급여 인상없음

사원번호를 입력(치환변수)하면
사원이름, 급여, 인상된 급여가 출력되도록 PL/SQL 블록을 생성하시오
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
    where employee_id = &사번;
    
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
    dbms_output.put_line('사원이름 : ' || v_ename);
    dbms_output.put_line('급여 : ' || v_sal);
    dbms_output.put_line('인상된 급여 : ' || v_upsal);
end;
/

-- 기본 LOOP문
declare
    v_num number(38) := 0;
begin
    loop
        v_num := v_num + 1;
        DBMS_OUTPUT.PUT_LINE(v_num);
        exit when v_num > 10; -- 종료 조건
    end loop;
end;
/

-- WHILE LOOP문
declare
    v_num number(38,0) := 1;
begin
    while v_num <= 5 loop -- 반복조건
        DBMS_OUTPUT.PUT_LINE(v_num);
        v_num := v_num + 1;
    end loop;
end;
/

-- 예제 : 1에서 10까지 정수값의 합
-- 1) 기본 loop
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
    while v_num <= 10 loop -- 반복조건
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_sum);
end;
/

-- FOR LOOP
begin
    for idx in reverse -10..5 loop -- reverse : 최대값부터 읽어옴, (-10/5)..(4/2)와 같이 연산도 가능
        if mod(idx, 2) <> 0 then -- mod : 나머지 연산자, <> : PLSQL에선 !=대신 사용
            DBMS_OUTPUT.PUT_LINE(idx);
        end if;
    end loop;
end;
/

-- 주의사항 2) 카운터(counter)
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

-- 예제 : 1에서 10까지 정수값의 합
-- 3) FOR LOOP
declare
    -- 정수값 : 1 ~ 10 => FOR LOOP의 카운터로 처리
    -- 합계
    v_total number(2, 0) := 0;
begin
    for i in 1..10 loop
        v_total := v_total + i;
    end loop;
    DBMS_OUTPUT.PUT_LINE(v_total);
end;
/

/*
1. 다음과 같이 출력되도록 하시오. -- loop문 각각으로 실행
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