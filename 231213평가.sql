--1
select employee_id, last_name, salary, department_id
from employees
where salary between 7000 and 12000
--and last_name like 'H%';
and substr(last_name, 1, 1) = 'H';

--2
select employee_id, last_name, 
    to_char(hire_date, 'MM/DD/YYYY day'), 
    to_char(salary*commission_pct, '$9,999.99') tnekd
from employees
order by tnekd desc;

--3
select employee_id, last_name, job_id, salary, department_id
from employees
where department_id in(50, 60)
and salary > 5000;

--4
select employee_id, last_name, department_id, 
        decode(department_id, 20, 'Canada',
                              80, 'UK',
                              'USA')
from employees;

--5
select e.employee_id, e.last_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

--6
select last_name, hire_date, 
        case when hire_date >= to_date('2005', 'YYYY') then 'New employee'
             when hire_date < to_date('2005', 'YYYY') then 'Career employee'
             end emcareer
from employees
where &employee_id = employee_id;

--7
select last_name, salary,
        case when salary<=5000 then salary*1.20
             when salary<=10000 then salary*1.15
             when salary<=15000 then salary*1.10
             else salary
             end upsal
from employees
where employee_id = &emp_id;

--8
select d.department_id, d.department_name, l.city
from departments d, locations l
where l.location_id = d.location_id;

--9
select employee_id, last_name, job_id
from employees
where department_id = (select department_id
                         from departments
                         where department_name = 'IT');

--10
select department_id, count(employee_id), trunc(avg(salary))
from employees
group by department_id;

--11
create table prof(
profno number(4),
name varchar2(15) not null,
id varchar2(15) not null,
hiredate date,
pay number(4));

--12
insert into 
select * from employees;
select * from departments;
select * from countries;
select * from prof;
select *
from regions;