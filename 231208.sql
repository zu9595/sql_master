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

select 'The job id for ' ||upper(last_name)||' is '||lower(job_id) as "EMPLOYEE DETAILS" --대문자 소문자 출력
from employees;