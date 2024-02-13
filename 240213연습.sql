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
values(1001, '총무팀', '본101호', '053-777-8777');
insert into department
values(1002, '회계팀', '본102호', '053-888-9999');
insert into department
values(1003, '영업팀', '본103호', '053-222-3333');
insert into employee
values(20121945, '박민수', to_date('20120302', 'yyyymmdd'), '대구', '010-1111-1234', 1001, ' ');
insert into employee
values(20101847, '박준식', to_char(to_date(20100901), 'yyyymmdd'), '경산', '010-2222-1234', 1003, ' ');
insert into employee
values(20122245, '선아라', to_char(to_date(20120302), 'yyyymmdd'), '대구', '010-3333-1222', 1002, ' ');
insert into employee
values(20121729, '이범수', to_char(to_date(20110302), 'yyyymmdd'), '서울', '010-3333-4444', 1001, ' ');
insert into employee
values(20121646, '이융희', to_char(to_date(20120901), 'yyyymmdd'), '부산', '010-1234-2222', 1001, ' ');
--9
alter table employee modify empname not null;
--10
select empname, hiredate, deptname
from employee e
right outer join department d
on(e.deptid = d.deptid);
--11
--12
--13
select e.empid,
    e.empname,
    e.birthday,
    d.deptname
    from employee e
    join department d
    on(d.deptid = e.deptid)
    where e.hiredate > (select hiredate
                        from employee
                        where empid = 20121729);
--14
grant create view to hr; -- 뷰 생성 권한 부여

create or replace view emp_vu -- or replace : drop없이 즉시 수정
as
    select e.empname,
            e.addr,
            d.deptname
    from employee e
            join department d
            on(d.deptid = e.deptid)
    where d.deptname='총무팀';
    
    select empname,
            addr,
            deptname
    from emp_vu;