Select *
from tab;

select *
from Employees;

desc employees;

desc departments;

select *
from departments;

select department_id, location_id
from departments;

select location_id, department_id
from departments;

select department_id, department_id
from departments;

select last_name, hire_date, salary
from  employees;

select last_name, salary, salary + 300
from employees;

select last_name, salary, 12*salary+100
from employees;

select last_name, salary, 12*(salary+100)
from employees;

select last_name, job_id, salary, commission_pct
from employees;

select last_name, 12*salary*commission_pct
from employees;

select last_name, 12*salary*nvl(commission_pct, 1)
from employees;

select last_name as name, commission_pct comm
from employees;

select last_name 이름, commission_pct 아아
from employees;

select last_name "name" , salary *12 "annual salary"
from employees;

select last_name||job_id "employees"
from employees;

select last_name||' is a '||job_id "employee details"
from employees;

select department_id
from employees;

select distinct department_id
from employees;

select distinct department_id, job_id
from employees;

--desc, select, from, "", '', ||,
--1
desc departments;
select *
from departments;

--2
desc employees;
select employee_id, last_name, job_id, hire_date "STARTDATE"
from employees;

--3
select DISTINCT job_id
from employees;

--4
select employee_id "Emp #", last_name "Employee", job_id||hire_date "Job 및 Hire Date"
from employees;

--5
select job_id||', '||last_name "Employee and Title"
from employees;

select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

select last_name, job_id, department_id
from employees
where last_name = 'Whalen';

select last_name
from employees
where hire_date = '05/10/10';

select last_name, salary
from employees
where salary<=3000;

select last_name, hire_date
from employees
where hire_date < '05/01/01';

select last_name, salary
from employees
where salary between 2500 and 3500;

select last_name, salary
from employees
where salary between 3500 and 2500;

select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100,101,201);

select first_name
from employees
where first_name like 'S%';

select last_name
from employees
where last_name like '%s';

select last_name, hire_date
from employees
where hire_date like '05%';

select last_name
from employees
where last_name like '_o%';

select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%';

select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' escape '\';

select employee_id, last_name, job_id
from employees
where job_id like '%SA3_%' escape '3';

select employee_id, last_name, job_id
from employees
where job_id like '%_A%';

select employee_id, last_name, job_id
from employees
where job_id like '%\_A%' escape '\';

select *
from employees
where commission_pct is null;

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
and job_id like '%MAN%';

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
or job_id like '%MAN%';

select last_name, job_id
from employees
where job_id
not in ('IT_PROG', 'ST_CLERK', 'SA_REP');

select last_name, job_id, salary
from employees
where job_id = 'SA_REP'
or job_id = 'AD_PRES'
and salary > 15000;

--where like, in, between, is null
--1
select last_name, salary
from employees
where salary > 12000;
--2
select last_name, department_id
from employees
where employee_id = 176;
--3
select last_name, salary
from employees
where not salary between 5000 and 12000;
--4
select last_name "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000
and (department_id = 20 or department_id = 50);

select last_name "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000
and department_id in (20, 50);
--5
select last_name, hire_date
from employees
where hire_date like '05%';

select last_name, hire_date
from employees
where hire_date between '05/01/01' and '05/12/31';
--6
select last_name, job_id
from employees
where manager_id is null;
--7
select last_name
from employees
where last_name like '__a%';
--8
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';
--9
select last_name, job_id, salary
from employees
where job_id in('SA_REP', 'ST_CLERK')
and not salary in(2500, 3500, 7000);
--10
select last_name, salary, commission_pct
from employees
where commission_pct*100 = 20;

select last_name, salary, commission_pct
from employees
where commission_pct = 0.2;