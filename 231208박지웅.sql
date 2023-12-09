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

--sql04
--1
select last_name||' earns '||to_char(salary, 'fm$99,999.00')||' monthly but wants '||to_char(salary*3, 'fm$99,999.00') "Dream salaries"
from employees;
--2
select last_name, hire_date, to_char(next_day(add_months(hire_date,6), '월'), 'YYYY.MM.DD "월요일"' ) review
from employees;
--3
select last_name, hire_date, to_char(start_date, 'day') day
from employees, job_history
order by next_day(start_date,'월')-start_date desc;
--4
select last_name, nvl(to_char(commission_pct), 'No Commission') comm, commission_pct
from employees;
--5
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