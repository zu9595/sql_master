select last_name, job_id, salary
from employees
where salary = (select min(salary)
                from employees);
                
select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 50);
                        
select employee_id, last_name, job_id, salary
from employees
where salary < any (select salary
                    from employees
                    where job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

select employee_id, last_name, job_id, salary
from employees
where salary < all (select salary
                    from employees
                    where job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

select employee_id, manager_id, department_id
from empl_demo
where (manager_id, department_id) in (select manager_id, department_id
                                        from empl_demo
                                        where first_name = 'John')
                                        and first_name <> 'John';

select employee_id, manager_id, department_id
from empl_demo
where manager_id in (select manager_id
                        from empl_demo
                        where first_name = 'John')
and department_id in (select department_id
                        from empl_demo
                        where first_name = 'John')
and first_name <> 'John';

insert into departments(department_id,
        department_name, manager_id, location_id)
values (70, 'Public Relations', 100, 1700);

insert into departments
values (71, 'Public Relations', 100, 1700);

insert into departments(department_id, department_name)
values(30, 'Purchasing');

insert into departments
values(100, 'Finance', '','');

insert into employees
values(113, 'Louis', 'Popp', 'Lpopp', '515.124.4567', sysdate, 'AC_ACCOUNT', 6900,
        null, 205, 110);

insert into employees
values(114, 'Den', 'Raphealy', 'DRAPHEAL', '515.127.4561', 
        to_date('FEB 3, 1999', 'MON DD, YYYY'), 'SA_REP', 11000, 0.2, 100, 60);
        
insert into departments
            (department_id, department_name, location_id)
values(&department_id, '&department_name', &location);

insert into sales_reps
select employee_id, last_name, salary, commission_pct
from employees
where job_id like '%REP%';

insert into copy_emp
select *
from employees;

insert into departments(department_id, department_name)
values(120, 'Yedam');

insert into departments(department_id)
values(120); --

insert into departments(department_name)
values('Yedam'); --

insert into departments(department_id, department_name, manager_id)
values(130, 'YD', 1); --

update employees
set department_id = 50
where employee_id = 113;

update copy_emp
set department_id = 110;

update employees
set job_id = 'IT_PROG', commission_pct = null
where employee_id = 114;

insert into copy_emp
select *
from employees;
commit;
delete copy_emp;

delete from departments
where department_name = 'Finance';

delete departments
where department_id in (30, 40);

delete copy_emp;

truncate table copy_emp;
--1
CREATE TABLE my_employee
  (id         NUMBER(4) NOT NULL,
   last_name  VARCHAR2(25),
   first_name VARCHAR2(25),
   userid     VARCHAR2(8),
   salary     NUMBER(9,2));
--2
select *
from my_employee;
--3
insert into my_employee
values(&ID, '&LAST_NAME', '&FIRST_NAME', '&USERID', &SALARY);
--4
select *
from my_employee;
--6
update my_employee
set first_name = 'Drexler'
where id = 3;
--7
update my_employee
set salary = 1000
where salary < 900;
--8
delete my_employee
where id = 3;
--11
delete my_employee;

select * from copy_emp;
select * from sales_reps;
select * from departments;
select * from employees;
rollback; --작업 초기화


-- 트랜잭션 : | d,d,u,i~ | co,cr
commit;

update employees
set salary = 99999
where employee_id = 176;

select *
from employees
where employee_id = 176;

rollback;


