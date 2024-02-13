--6
create table department(
    deptid number(10) not null,
    deptname varchar2(10),
    location varchar2(10),
    tel varchar2(15)
    );
create table employee(
    empid number(10) not null,
    empname varchar2(10),
    hiredate date,
    addr varchar2(12),
    tel varchar2(15),
    deptid number(10)
    );
--7
alter table employee add birthday date;
--8
insert into department
values(1001, 'ÃÑ¹«ÆÀ', 'º»101È£', '053-777-8777');
insert into department
values(1002, 'È¸°èÆÀ', 'º»102È£', '053-888-9999');
insert into department
values(1003, '¿µ¾÷ÆÀ', 'º»103È£', '053-222-3333');
insert into employee
values(20121945, '¹Ú¹Î¼ö', to_char(to_date(20120302), 'yyyymmdd'), '´ë±¸', '010-1111-1234', 1001, null);
insert into employee
values(20101847, '¹ÚÁØ½Ä', to_char(to_date(20100901), 'yyyymmdd'), '°æ»ê', '010-2222-1234', 1003, null);
insert into employee
values(20122245, '¼±¾Æ¶ó', to_char(to_date(20120302), 'yyyymmdd'), '´ë±¸', '010-3333-1222', 1002, null);
insert into employee
values(20121729, 'ÀÌ¹ü¼ö', to_char(to_date(20110302), 'yyyymmdd'), '¼­¿ï', '010-3333-4444', 1001, null);
insert into employee
values(20121646, 'ÀÌÀ¶Èñ', to_char(to_date(20120901), 'yyyymmdd'), 'ºÎ»ê', '010-1234-2222', 1001, null);
--9
alter table employee modify empname not null;
--10
select empname, hiredate, deptname
from employee e
right outer join department d
on(e.deptid = d.deptid);
--11
delete from employee where addr = '´ë±¸';
--12
update department SET deptname = 'È¸°èÆÀ' where deptname = '¿µ¾÷ÆÀ';
--13
select empid, empname, birthday, deptname
from employee e
right outer join department d
on(e.deptid = d.deptid)
where e.hiredate > (select hiredate from employee where empid = 20121729);
--14
grant create view to hr;

create or replace view emp_vu
as
select empname, addr, deptname
from employee e
right outer join department d
on(e.deptid = d.deptid)
where d.deptname = 'ÃÑ¹«ÆÀ';

select empname, addr, deptname
from emp_vu;