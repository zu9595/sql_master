--이클립스에서 oraclexe/product/jdbc/ojdbc6_g
select * from tab;

create table student(
student_number varchar2(10) primary key,
student_name varchar2(100) not null,
english_score number default 80,
mathmatic_score number default 70);

--등록, 수정, 삭제, 단건조회, 목록.
insert into student(student_number, student_name, english_score, mathmatic_score)
values('23-001', '홍길동', 70, 75);

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-002', '김민수');

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-007', '김민수');

insert into student(student_number, student_name)--, english_score, mathmatic_score)
values('23-008', '김민수');

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
where student_name = '김민수';

create table book(
book_code varchar2(10) primary key,
book_name varchar2(100) not null,
book_writer varchar2(10),
book_maker varchar2(100),
book_price number default 0);

drop table book;
select * from book;


--프로젝트
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
where board_writer = '관리자'
order by 1;

insert into accountinfo
values('abc', 1234, 'test');
insert into board(board_no, board_id, board_title, board_inside, board_writer, board_date)
values(11, '잡담', '테스트용', 'asdf', 'test', to_date(sysdate, 'YY-MM-DD'));


--231222
select *
from student;

select * from student
where student_name like '%'길동'%';
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
values(board_seq.nextval, '첫번째 글', '홍길동', 'JSP 어렵다');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '오늘은 금요일', '홍길동', '불코딩하자');
insert into board (board_no, title, writer, content)
values(board_seq.nextval, '우리반 화이팅', '최승민', '이거 왜 안돼지');

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

insert into member values('user1', '1111', '홍길동', 'User');
insert into member values('user2', '2222', '김철수', 'User');
insert into member values('user3', '3333', '관리자', 'Admin');
insert into member values('user4', '4444', '최승민', 'User');
insert into member values('user5', '5555', '안철수', 'User');
commit;
delete board;
delete sequence board_seq;


--231228 시험--
delete from product where product_name like '과테말라 안티구아';
drop table product;

create table product (
 product_code char(8) primary key, -- P2023-01
 product_name varchar2(100) not null,
 product_desc varchar2(300) not null,
 origin_price number not null,
 sale_price number,
 like_it number default 3, --추천수
 image varchar2(40)
);

insert into product values('P2023-01', '과테말라 안티구아', '과테말라산 원두입니다.', 5000, 4500, 0, '과테말라.jpg');
insert into product values('P2023-02', '니카라구아 아라비카', '아라비카입니다.', 5500, 4500, 0, '니카라구아 더치.jpg');
insert into product values('P2023-03', '브라질산토스', '브라질산토스 맛있는 커피입니다', 6000, 5000, 0, '브라질산토스.jpg');
insert into product values('P2023-04', '에티오피아 예가체프', '예가체프.', 4000, 3500, 0, '에티오피아 예가체프.jpg');
insert into product values('P2023-05', '케냐 오크라톡신', '오크라톡신.', 4500, 3000, 0, '케냐 오크라톡신.jpg');
insert into product values('P2023-06', '코스타리카 따라주', '따라주.', 3000, 2500, 0, '코스타리카 따라주.jpg');

select product_code, product_name, product_desc, to_char(origin_price, '9,999'), to_char(sale_price, '9,999'), like_it, image
from product order by 1;

select * from product where product_code = 'P2023-02';


--댓글(댓글번호, 게시글번호, 내용, 작성자, 작성일시)
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
values(reply_seq.nextval, 1, '하하하', '홍길동', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 1, '하하', '홍길동', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 1, '하', '홍길동', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 2, '하', '홍길동', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 2, '하하', '홍길동', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 2, '하하하', '홍길동', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 3, '하하', 'user1', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 3, '하하하', 'user3', to_date(sysdate, 'YY-MM-DD'));

insert into reply (reply_no, board_no, reply, replyer, reply_date)
values(reply_seq.nextval, 4, '하하하하', 'user4', to_date(sysdate, 'YY-MM-DD'));

delete from reply
where replyer = '홍길동';
select * from reply;

select r.*, m.name
from reply r
join member m
on r.replyer = m.id
where board_no = 3
order by 1;

-- 댓글 페이징.
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

--240110 시험--
create table books (
 book_code varchar2(10) primary key,
 book_name varchar2(100) not null,
 book_author varchar2(100) not null,
 book_press varchar2(100) not null,
 book_price number not null
);

insert into books
values('p00000006', '파피용', '누구', '신흥출판사', 25000);