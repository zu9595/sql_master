--��Ŭ�������� oraclexe/product/jdbc/ojdbc6_g
select * from tab;

create table student(
student_number varchar2(10) primary key,
student_name varchar2(100) not null,
english_score number default 80,
mathmatic_score number default 70);

--���, ����, ����, �ܰ���ȸ, ���.
insert into student(student_number, student_name, english_score, mathmatic_score)
values('23-001', 'ȫ�浿', 70, 75);

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-002', '��μ�');

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-007', '��μ�');

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-008', '��μ�');

select * from student;
update student
set english_score = 85,
    mathmatic_score = 75
where student_number = '23-002';

delete from student 
where student_number = '23-002';

select * from student
where student_number = '23-002';

delete from student 
where student_name = '��μ�';

create table book(
book_code varchar2(10) primary key,
book_name varchar2(100) not null,
book_writer varchar2(10),
book_maker varchar2(100),
book_price number default 0);

drop table book;
select * from book;


--������Ʈ
drop table accountinfo;
drop table board;

create table board(
board_no number primary key,
board_id varchar2(20),
board_title varchar2(100),
board_inside varchar2(1000),
board_writer varchar2(20),
board_date varchar2(20),
board_joins number default 0);

create table accountinfo(
user_id varchar2(20) primary key not null,
user_pw varchar2(20),
user_nick varchar2(20));

select * from board;
select * from accountinfo;


delete from board where board_no between 11 and 16;
delete accountinfo where user_id = 'abc';
rollback;

select *
from board 
where board_writer = '������'
order by 1;

insert into accountinfo
values('abc', 1234, 'test');
insert into board(board_no, board_id, board_title, board_inside, board_writer, board_date)
values(11, '���', '�׽�Ʈ��', 'asdf', 'test', to_date(sysdate, 'YY-MM-DD'));


--231222
select *
from student;

select * from student
where student_name like '%'�浿'%';
drop table board;
create table board(
board_no number primary key,
title varchar2(100) not null,
content varchar2(500) not null,
writer varchar2 (50) not null,
writer_date date default sysdate,
click_cnt number default 0,
image varchar2(100)
);
create sequence board_seq;
insert into board (board_no, title, writer, content)
values(board_seq.nextval, 'ù��° ��', 'ȫ�浿', 'JSP ��ƴ�');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '������ �ݿ���', 'ȫ�浿', '���ڵ�����');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '�츮�� ȭ����', '�ֽ¹�', '�̰� �� �ȵ���');

select * from board order by 1;

select * from member;
drop table member;

create table member(
id varchar2(20) primary key,
pw varchar2(10) not null,
name varchar2(100) not null,
responsibility varchar2(10) default 'User'); --Admin/ User

insert into member values('user1', '1111', 'ȫ�浿', 'User');
insert into member values('user2', '2222', '��ö��', 'User');
insert into member values('user3', '3333', '������', 'Admin');
insert into member values('user4', '4444', '�ֽ¹�', 'User');
commit;
delete board;
delete sequence board_seq;
