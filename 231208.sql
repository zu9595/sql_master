select last_name, job_id, department_id, hire_date
from employees
order by hire_date; --정렬(기본적으로 오름차순[asc]), 가장 아래쪽에 들어감

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc; --내림차순 정렬

select employee_id, last_name, salary*12 annsal
from employees
order by annsal; --바뀐 컬럼명도 인식함

select last_name, job_id, department_id, hire_date
from employees
order by 3; -- select 3번째 컬럼을 기준으로 정렬, 안되는 프로그램도 있음

select last_name, department_id, salary
From employees
order by department_id, salary desc; --써있는 순서대로 정렬

select employee_id, salary
from employees
order by hire_date; --컬럼출력을 하지않아도 해당 컬럼 기준으로 정렬가능

select employee_id, last_name, salary, department_id
from employees
where employee_id = &search_id; -- &xx : 한번 입력 받고 버리는 변수

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column;

select employee_id, last_name, job_id, &&column_name -- &&xx : 한번 실행하면 변수 값이 고정됨
from employees
order by &column_name;

select employee_id, salary
from employees
order by &column_name;

undefine column_name; --고정된 변수 값을 초기화

select *
from job_history;

select employee_id, job_id
from employees
union --위와 아래의 컬럼을 합쳐서 출력(중복값은 하나만 출력)
select employee_id, job_id
from job_history;

select employee_id, job_id, department_id
from employees
union all --위와 아래의 컬럼을 중복까지 전부 합쳐서 정렬없이 출력
select employee_id, job_id, department_id
from job_history
order by employee_id;

select employee_id, job_id
from employees
intersect --위와 아래의 컬럼에서 중복된 값만 1개씩 출력
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history 
intersect 
select employee_id, job_id
from employees; --위아래가 바뀌어도 같음

select employee_id, job_id
from employees
minus --위에서 아래의 컬럼을 뺀 값만 출력
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history 
minus
select employee_id, job_id
from employees;

desc dual;

select *
from dual;

select sysdate
from employees;

select sysdate
from dual;

select 'The job id for ' ||upper(last_name)||' is '||lower(job_id) as "EMPLOYEE DETAILS" --대문자 소문자
from employees;

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

select last_name, substr(last_name, 4)
from employees
where department_id = 90;

select last_name, substr(last_name, 2, 2)
from employees
where department_id = 90;

select last_name, substr(last_name, -3, 2)
from employees
where department_id = 90;

select employee_id, concat(first_name, last_name) name, job_id, length(last_name), instr(last_name, 'a') "contains 'a'?"
from employees
where substr(job_id, 4) = 'REP';

select ltrim('yyedaymy', 'yea')
from dual;

select rtrim('yyedaymy', 'yea')
from dual;

select  round(345.678)as round1,
        round(345.678, 0)as round2,
        round(345.678, 1)as round3,
        round(345.678, -1)as round4
from dual;
          
select  trunc(345.678)as trunc1,
        trunc(345.678, 0)as trunc2,
        trunc(345.678, 1)as trunc3,
        trunc(345.678, -1)as trunc4
from dual;
          
select last_name, salary, mod(salary, 5000)
from employees;

--1
select sysdate "Date"
from dual;
--2
select employee_id, last_name, salary,
    round(salary*1.15, 0) "New Salary"
from employees;
--3
select employee_id, last_name, salary, 
    round(salary*1.15, 0) "New Salary", 
    round(salary*1.15)-salary "Increase"
from employees;
--4
select upper(last_name) name, length(last_name) "name_length"
from employees
where substr(last_name, 1, 1) in ('J', 'A', 'M')
order by 1;

select sysdate
from dual;

select last_name, (sysdate-hire_date) /7 "WEEKS"
from employees
where department_id = 90;

select employee_id, hire_date, months_between(sysdate, hire_date) "TENURE",
    add_months(hire_date, 6) "REVIEW",
    next_day(hire_date, '금'),
    last_day(hire_date)
from employees;

select  round(sysdate, 'YEAR'),
        round(sysdate, 'MONTH'),
        round(sysdate, 'DAY'),
        round(sysdate, 'DD')
from dual;

select  trunc(sysdate, 'YEAR'),
        trunc(sysdate, 'MONTH'),
        trunc(sysdate, 'DAY'),
        trunc(sysdate, 'DD')
from dual;

select *
from employees
where employee_id = '101';

alter session set
nls_date_language = american;

select employee_id, to_char(hire_date, 'MM/YY') "Month_Hired"
from employees;

select last_name, to_char(hire_date, 'fmdd MONTH YYYY') "HireDate"
from employees;

select last_name, to_char(hire_date, 'fmddspth "of" Month YYYY fmHH:MI:SS AM')
from employees;

select to_char(salary, '$99,999.00') "SALARY"
from employees;

select to_number('$3,400', '$99,999')
from dual;

select to_date('2010년, 02월', 'yyyy"년", MM"월"')
from dual;

select last_name, hire_date
from employees
where hire_date>
to_date('2005년 07월 01일', 'YYYY"년" MM"월" DD"일"');

select last_name, hire_date
from employees
where hire_date>
to_date('05/07/01', 'YY-MM-DD');

select last_name, salary, nvl(commission_pct, 0),
(salary*12) +(salary*12*nvl(commission_pct,0)) "AN_SAL"
from employees;

select last_name, salary, nvl(to_char(commission_pct), '보너스 없음')
from employees;

select last_name, salary, nvl2(commission_pct, 'SAL+COM', 'SAL') "income"
from employees;

select first_name, length(first_name) "expr1", last_name, length(last_name) "expr2", nullif(length(first_name), length(last_name)) result
from employees;

select last_name, job_id, salary,
        case job_id when 'IT_PROG'  THEN 1.10*salary
                    when 'ST_CLERK' THEN 1.15*salary
                    when 'SA_REP'   THEN 1.20*salary
                    else salary
        end "REVISED_SALARY"
from employees;

SELECT last_name, salary,
       CASE WHEN salary<5000   THEN 'Low'
            WHEN salary<10000  THEN 'Medium'
            WHEN salary<20000  THEN 'Good'
            else job_id
            end "SALARY_JOB"
from employees;

select last_name, job_id, salary,
        decode(job_id, 'IT_PROG',   1.10*salary,
                        'ST_CLERK', 1.15*salary,
                        'SA_REP',   1.20*salary,
                                    salary)
        REVISED_SALARY
from employees;
--5
select last_name, round((sysdate - hire_date)/12,0) months_worked
from employees;
--6
select first_name, substr('###############', 1+length(salary))||to_char(salary) salary
from employees;
--7
select last_name, round((sysdate - hire_date) /7) tenure
from employees
where department_id = 90;
--8
select last_name||' earns '||to_char(salary, 'fm$99,999.00')||' monthly but wants '||to_char(salary*3, 'fm$99,999.00') "Dream salaries"
from employees;
--9
select last_name, hire_date, to_char(next_day(add_months(hire_date,6), '월'), 'YYYY.MM.DD "월요일"' ) review
from employees;
--10
select last_name, hire_date, to_char(start_date, 'day') day
from employees, job_history
order by next_day(start_date,'월')-start_date desc;
--11
select last_name, nvl(to_char(commission_pct), 'No Commission') comm, commission_pct
from employees;
--12
select job_id,
        decode(job_id,  'AD_PRES',  'A',
                        'ST_MAN',   'B',
                        'IT_PROG',  'C',
                        'SA_REP',   'D',
                        'ST_CLERK', 'E',
                        0)
        value
from employees
order by value;

select job_id,
        case job_id WHEN 'AD_PRES'  THEN 'A'
                    WHEN 'ST_MAN'   THEN 'B'
                    WHEN 'IT_PROG'  THEN 'C'
                    WHEN 'SA_REP'   THEN 'D'
                    WHEN 'ST_CLERK' THEN 'E'
                    ELSE '0'
        END value
from employees
order by value;