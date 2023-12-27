--ÀÌÅ¬¸³½º¿¡¼­ oraclexe/product/jdbc/ojdbc6_g
select * from tab;

create table student(
student_number varchar2(10) primary key,
student_name varchar2(100) not null,
english_score number default 80,
mathmatic_score number default 70);

--µî·Ï, ¼öÁ¤, »èÁ¦, ´Ü°ÇÁ¶È¸, ¸ñ·Ï.
insert into student(student_number, student_name, english_score, mathmatic_score)
values('23-001', 'È«±æµ¿', 70, 75);

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-002', '±è¹Î¼ö');

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-007', '±è¹Î¼ö');

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-008', '±è¹Î¼ö');

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
where student_name = '±è¹Î¼ö';

create table book(
book_code varchar2(10) primary key,
book_name varchar2(100) not null,
book_writer varchar2(10),
book_maker varchar2(100),
book_price number default 0);

drop table book;
select * from book;


--ÇÁ·ÎÁ§Æ®
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
where board_writer = '°ü¸®ÀÚ'
order by 1;

insert into accountinfo
values('abc', 1234, 'test');
insert into board(board_no, board_id, board_title, board_inside, board_writer, board_date)
values(11, 'Àâ´ã', 'Å×½ºÆ®¿ë', 'asdf', 'test', to_date(sysdate, 'YY-MM-DD'));


--231222
select *
from student;

select * from student
where student_name like '%'±æµ¿'%';
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
values(board_seq.nextval, 'Ã¹¹øÂ° ±Û', 'È«±æµ¿', 'JSP ¾î·Æ´Ù');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '¿À´ÃÀº ±İ¿äÀÏ', 'È«±æµ¿', 'ºÒÄÚµùÇÏÀÚ');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '¿ì¸®¹İ È­ÀÌÆÃ', 'ÃÖ½Â¹Î', 'ÀÌ°Å ¿Ö ¾ÈµÅÁö');

select * from board order by 1;

select * from member;
drop table member;

create table member(
id varchar2(20) primary key,
pw varchar2(10) not null,
name varchar2(100) not null,
responsibility varchar2(10) default 'User'); --Admin/ User

insert into member values('user1', '1111', 'È«±æµ¿', 'User');
insert into member values('user2', '2222', '±èÃ¶¼ö', 'User');
insert into member values('user3', '3333', '°ü¸®ÀÚ', 'Admin');
insert into member values('user4', '4444', 'ÃÖ½Â¹Î', 'User');
commit;
delete board;
delete sequence board_seq;
