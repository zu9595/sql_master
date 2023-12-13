create table emp_test(
empid number(5),
empname varchar2(10) not null,
duty varchar2(9),
sal number(7,2),
bonus number(7,2),
mgr number(5),
hire_date date,
deptid number(2));

insert into emp_test(empid, empname)
values(10,null);

insert into emp_test(empid, empname)
values(10,'YD');

create table dept_test(
    deptid number(2),
    dname varchar2(14),
    loc varchar2(13),
    unique(dname));
    
insert into dept_test(deptid, dname)
values(10,null);

insert into dept_test(deptid, dname)
values(20,'YD');

insert into dept_test(deptid, dname)
values(20,10);

drop table dept_test;

create table dept_test(
deptid number(2) PRIMARY KEY,
dname varchar2(14),
loc varchar2(13),
unique(dname));

insert into dept_test
values(10, 'YD', 'Daegu');

insert into dept_test
values(20, 'YD1', 'Daegu');

insert into dept_test
values(20, 'YD2', 'Daegu');

insert into dept_test
values(null, 'YD3', 'Daegu');

drop table emp_test;

create table emp_test(
empid number(5), 
empname varchar2(10) not null,
duty varchar2(9),
sal number(7,2),
bonus number(7,2),
mgr number(5),
hire_date date,
deptid number(2),
foreign key(deptid) references dept_test(deptid) on delete set null);

--deptid number(2) references dept_test(deptid));

insert into emp_test(empid, empname, deptid)
values(100, 'YD1', 10);

insert into emp_test(empid, empname, deptid)
values(200, 'YD2', null);

insert into emp_test(empid, empname, deptid)
values(300, 'YD3', 30);

alter table emp_test
modify deptid references dept_test(deptid) on delete set null;

drop table emp_test;

select *
from emp_test;

delete dept_test
where deptid = 10;

select *
from dept_test;

alter table emp_test
add primary key(empid);

alter table emp_test
add foreign key(mgr) references emp_test(empid);

alter table emp_test
modify(duty varchar2(9) not null);
--modify(duty not null); --오라클은 가능

select constraint_name, column_name
from user_cons_columns;

desc user_cons_columns;

select constraint_name, table_name, column_name
from user_cons_columns
where table_name = 'EMP_TEST';

alter table emp_test
drop constraint sys_c007xxx;

create view empvu80 --view는 alter로 수정이 불가 [or replace]로 대체만 가능
as select employee_id, last_name, salary
    from employees
    where department_id = 80;

select * from empvu80; 

create view salvu50
as select employee_id id_number, last_name name, salary*12 ann_salary
from employees
where department_id = 50;

select * from salvu50;

create or replace view empvu80(id_number, name, sal, department_id)
as select employee_id, first_name||' '||last_name, salary, department_id
    from employees
    where department_id = 80;

create or replace view dept_sum_vu(name, minsal, maxsal, avgsal)
as select d.department_name, min(e.salary), max(e.salary), avg(e.salary)
    from employees e join departments d
    on(e.department_id = d.department_id)
    group by d.department_name;

select * from dept_sum_vu;

select rownum, employee_id
from employees;

commit;

delete empvu80
where id_number = 176;

select * from empvu80;
select * from employees;

delete dept_sum_vu
where name = 'IT'; --삭제 불가

create view test_vu
as select department_name
    from departments;

select * from test_vu;

insert into test_vu
values('YD');

create sequence dept_deptid_seq
                increment by 10
                start with 120
                maxvalue 9999
                nocache
                nocycle;
                
insert into departments(department_id, department_name, location_id)
values(dept_deptid_seq.nextval, 'Support', 2500);

select * from departments;

rollback;

create synonym d_sum
for dept_sum_vu;

select * from d_sum;
select * from dept_sum_vu;

select *
from system_privilege_map;

--관리자권한으로
create user skj
identified by test;

grant create session
to skj;

grant create session, create table, create view
to skj;

revoke create table, create view
from skj;

alter user skj
identified by lion;

create user yedam
identified by yedam
default tablespace users
temporary tablespace temp;

grant connect, dba
to yedam;

revoke select
on hr.employees
from yedam;

--계층적 질의
select level, employee_id, last_name, manager_id
from employees
START WITH manager_id IS NULL
connect by prior employee_id = manager_id;
--CONNECT BY manager_id = prior employee_id;

select level, employee_id, last_name, manager_id
from employees
START WITH manager_id IS NULL
connect by prior manager_id = employee_id;

select level, lpad(' ', 4*(level-1))||employee_id employee, last_name, manager_id
from employees
start with manager_id is null
connect by prior employee_id = manager_id;