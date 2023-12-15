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
create table board(
board_no number primary key,
board_id varchar2(20) not null,
board_title varchar2(100) not null,
board_inside varchar2(1000) not null,
board_writer varchar2(20) not null,
board_date varchar2(20) not null,
board_joins number default 0);

create table accountinfo(
user_id varchar2(20) primary key not null,
user_pw varchar2(20) not null);

select * from board;
select * from inside;
select * from accountinfo;

drop table board;
delete from board where board_no = 1;
rollback;

insert into board(board_no, board_id, board_title, board_inside, board_writer, board_date)
values(1, '공지사항', '게시판 이용수칙 안내', '테스트중입니다', '관리자', to_date(sysdate, 'YY-MM-DD'));
