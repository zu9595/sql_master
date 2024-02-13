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
