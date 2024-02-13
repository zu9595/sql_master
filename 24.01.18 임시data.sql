
--member
select * from member;

insert into member
 values ('user1', '1111', '홍길동', '남', '010-1111-1111', 'user1@naver.com', '대구', '달서구', 'user');
insert into member
 values ('user2', '2222', '이지은', '여', '010-2222-2222', 'user2@naver.com', '대구', '달서구', 'user'); 
insert into member
 values ('user3', '3333', '이요한', '남', '010-3333-3333', 'user3@naver.com', '대구', '달서구', 'user');
insert into member
 values ('user4', '4444', '김지영', '여', '010-4444-4444', 'user4@naver.com', '대구', '달서구', 'user'); 
insert into member
 values ('user5', '5555', '김지은', '여', '010-5555-5555', 'user5@naver.com', '대구', '달서구', 'user');  
 
 
select o.order_no,o.user_id,c.mypro_cnt,c.pro_code,c.pro_price  from orderlist o,cart c where c.user_id = o.user_id and c.user_id='user1' and o.order_no=1;
select * from orderlist;
select * from review;
select * from product where pro_code=3;
select * from productimage;
select * from member;
delete from member where user_name='ddddd';
--cart
select * from cart;

insert into cart
 values (mypro_no_seq.nextval, 'user1', 1, 20000, 18000, 2); 
insert into cart
 values (mypro_no_seq.nextval, 'user2', 3, 10000, 8000, 1);  
 
--product
select * from product;

insert into product
 values (pro_code_seq.nextval, '2024 위클리', '좋아요', 'b2.jpg', 20000, 18000, 0, 50, '다이어리');
insert into product
 values (pro_code_seq.nextval, '2024 위클리', '좋아요', 'b1.jpg', 20000, 18000, 0, 50, '다이어리');
insert into product
 values (pro_code_seq.nextval, '2024 먼슬리', '좋아요', 'b1.jpg', 28000, 25000, 0, 50, '다이어리');
insert into product
 values (pro_code_seq.nextval, '2024 캘린더', '좋아요', 'b1.jpg', 15000, 10000, 0, 50, '캘린더'); 

--inquire
select * from inquire;

insert into inquire
 values (inq_no_seq.nextval, '홍길동', 1, '문의드려요', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', '2024/01/15', 'D001.png', '답변');
insert into inquire
 values (inq_no_seq.nextval, '김유준', 1, '문의드려요', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', '2024/01/15', 'D002.png', '답변');
insert into inquire
 values (inq_no_seq.nextval, '오주홍', 1, '문의드려요', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', '2024/01/15', 'D002.png', '답변');

--orderlist
select * from orderlist;

insert into orderlist 
 values (order_no_seq.nextval, '2024/01/15', 1, 'user1', '홍길동', '대구', '달서구', '010-1111-1111', 13500, 3000,  '문앞', '배송중'); 
insert into orderlist 
 values (order_no_seq.nextval, '2024/01/15', 4, 'user2', '이지은', '대구', '달서구', '010-2222-2222', 50000, 0, '문앞', '배송완료'); 
insert into orderlist 
 values (order_no_seq.nextval, '2024/01/15', 3, 'user3', '이요한', '대구', '달서구', '010-3333-3333', 18000, 3000, '문앞', '배송준비중');
insert into orderlist 
 values (order_no_seq.nextval, '2024/01/14', 3, 'user1', '홍길동', '대구', '달서구', '010-1111-1111', 18000, 3000, '문앞', '배송준비중'); 

--orderdetail
select * from orderdetail;

insert into orderdetail values (24011501, 1, 5, 13500);
insert into orderdetail values (24011504, 4, 2, 50000);
insert into orderdetail values (24011503, 3, 1, 18000);
insert into orderdetail values (24011403, 3, 1, 18000);

 
--review
select * from review;

insert into review
 values (re_no_seq.nextval, 24011501, 1, 'user1', '리뷰', 3,'ㅇㅇㅇㅇㅇㅇㅇ', 'pen_Sample.jpg', '2024/01/18');
insert into review
 values (re_no_seq.nextval, 24011504, 4, 'user2', '리뷰', 5,'ㅇㅇㅇㅇㅇㅇㅇ', 'b1.jpg', '2024/01/18'); 
 
--productimage
select * from productimage;

insert into productimage
 values (img_no_seq.nextval, 1, '메인', 'pen_Sample.jpg');
insert into productimage
 values (img_no_seq.nextval, 1, '상세', 'pen_Sample.jpg');
insert into productimage
 values (img_no_seq.nextval, 1, '상세', 'pen_Sample.jpg');
insert into productimage
 values (img_no_seq.nextval, 1, '상세', 'pen_Sample.jpg');
insert into productimage
 values (img_no_seq.nextval, 2, '메인', 'diary_sample.jpg'); 
insert into productimage
 values (img_no_seq.nextval, 2, '상세', 'diary_sample.jpg'); 
insert into productimage
 values (img_no_seq.nextval, 2, '상세', 'diary_sample.jpg'); 
insert into productimage
 values (img_no_seq.nextval, 2, '상세', 'diary_sample.jpg');  

--banner
select * from banner;

insert into banner
values ( '배너1', '배너1 설명입니다', 'img/chalk.png');
insert into banner
values ( '배너2', '배너2 설명입니다', 'img/C001.png');
insert into banner
values ( '배너3', '배너3 설명입니다', 'img/post_it.png');

--
commit;
 