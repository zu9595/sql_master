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

select * from member
order by 1;
alter table member add image varchar2(100);

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
insert into member values('user5', '5555', '��ö��', 'User');
commit;
delete board;
delete sequence board_seq;


--231228 ����--
delete from product where product_name like '���׸��� ��Ƽ����';
drop table product;

create table product (
 product_code char(8) primary key, -- P2023-01
 product_name varchar2(100) not null,
 product_desc varchar2(300) not null,
 origin_price number not null,
 sale_price number,
 like_it number default 3, --��õ��
 image varchar2(40)
);

insert into product values('P2023-01', '���׸��� ��Ƽ����', '���׸���� �����Դϴ�.', 5000, 4500, 0, '���׸���.jpg');
insert into product values('P2023-02', '��ī�󱸾� �ƶ��ī', '�ƶ��ī�Դϴ�.', 5500, 4500, 0, '��ī�󱸾� ��ġ.jpg');
insert into product values('P2023-03', '��������佺', '��������佺 ���ִ� Ŀ���Դϴ�', 6000, 5000, 0, '��������佺.jpg');
insert into product values('P2023-04', '��Ƽ���Ǿ� ����ü��', '����ü��.', 4000, 3500, 0, '��Ƽ���Ǿ� ����ü��.jpg');
insert into product values('P2023-05', '�ɳ� ��ũ�����', '��ũ�����.', 4500, 3000, 0, '�ɳ� ��ũ�����.jpg');
insert into product values('P2023-06', '�ڽ�Ÿ��ī ������', '������.', 3000, 2500, 0, '�ڽ�Ÿ��ī ������.jpg');

select product_code, product_name, product_desc, to_char(origin_price, '9,999'), to_char(sale_price, '9,999'), like_it, image
from product order by 1;

select * from product where product_code = 'P2023-02';


--���(��۹�ȣ, �Խñ۹�ȣ, ����, �ۼ���, �ۼ��Ͻ�)
drop table reply;
create table reply(
reply_no number primary key,
board_no number not null,
reply varchar2(100) not null,
replyer varchar2(30) not null,
reply_date date default sysdate
);

create sequence reply_seq;
insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 1, '������', 'ȫ�浿', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 1, '����', 'ȫ�浿', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 1, '��', 'ȫ�浿', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 2, '��', 'ȫ�浿', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 2, '����', 'ȫ�浿', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 2, '������', 'ȫ�浿', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 3, '����', 'user1', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 3, '������', 'user3', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 4, '��������', 'user4', to_date(sysdate, 'YY-MM-DD'));

delete from reply
where replyer = 'ȫ�浿';
select * from reply;

select r.*, m.name
from reply r
join member m
on r.replyer = m.id
where board_no = 3
order by 1;

-- ��� ����¡.
select b.* from
(select rownum rn, a.* from
(select r.*, m.name
    from reply r
    join member m
    on r.replyer = m.id
    where board_no = 1
    order by 1
    ) a ) b
where b.rn > (1-1)*5 and b.rn <= 1*5;

--240108
select * from reply;
select * from reply
where board_no = 3
order by 1;

insert into reply
select reply_seq.nextval, 3, 'test', 'user1', sysdate
from reply;

select replyer, count(*)
from reply
group by replyer;

select name, count(*)
from reply r
join member m
on r.replyer = m.id
group by name;

--240110 ����--
create table books (
 book_code varchar2(10) primary key,
 book_name varchar2(100) not null,
 book_author varchar2(100) not null,
 book_press varchar2(100) not null,
 book_price number not null
);

insert into books
values('p00000006', '���ǿ�', '����', '�������ǻ�', 25000);