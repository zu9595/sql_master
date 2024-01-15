commit;

--member
select * from member;

insert into member
 values ('user1', '1111', '홍길동', '남', '010-1111-1111', 'user1@naver.com', 'user');
insert into member
 values ('user2', '2222', '이지은', '여', '010-2222-2222', 'user2@naver.com', 'user'); 
insert into member
 values ('user3', '3333', '이요한', '남', '010-3333-3333', 'user3@naver.com', 'user');
insert into member
 values ('user4', '4444', '김지영', '여', '010-4444-4444', 'user4@naver.com', 'user'); 
insert into member
 values ('user5', '5555', '김지은', '여', '010-5555-5555', 'user5@naver.com', 'user');  
 
--cart
select * from cart;

insert into cart
 values (3, 'user1', 1, 20000, 2); 
insert into cart
 values (4, 'user2', 3, 10000, 1);  
 
--product
select * from product;

insert into product
 values (3, '2024 위클리', '좋아요', 'b1.jpg', 20000, 18000, 0, 50, '다이어리');
insert into product
 values (4, '2024 먼슬리', '좋아요', 'b1.jpg', 28000, 25000, 0, 50, '다이어리');
insert into product
 values (5, '2024 캘린더', '좋아요', 'b1.jpg', 15000, 10000, 0, 50, '캘린더'); 

--inquire
select * from inquire;

insert into inquire
 values (1, '홍길동', 1, '문의드려요', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', '2024/01/15', 'D001.png', '답변');
insert into inquire
 values (2, '이이이', 1, '문의드려요', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', '2024/01/15', 'D002.png', '답변');
insert into inquire
 values (3, '오오오', 1, '문의드려요', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', '2024/01/15', 'D002.png', '답변');

--orderlist
select * from orderlist;

insert into orderlist 
 values (24011501, '2024/01/15', 'user1', '홍길동', '대구', '달서구', '010-1111-1111', 13500, 3000,  '문앞'); 
insert into orderlist 
 values (24011504, '2024/01/15', 'user2', '이지은', '대구', '달서구', '010-2222-2222', 50000, 0, '문앞'); 
insert into orderlist 
 values (240115013, '2024/01/15', 'user3', '이요한', '대구', '달서구', '010-3333-3333', 18000, 3000, '문앞');

--orderdetail
select * from orderdetail;

insert into orderdetail
 values (1, 24011501, 5, 13500);
insert into orderdetail
 values (4, 24011504, 2, 50000);
insert into orderdetail
 values (3, 24011503, 1, 18000); 

 
--review
select * from review;

insert into review
 values (1, 24011501, 1, 'user1', '리뷰', 3,'ㅇㅇㅇㅇㅇㅇㅇ', 'pen_Sample.jpg', '2024/01/18');
insert into review
 values (2, 24011504, 4, 'user2', '리뷰', 5,'ㅇㅇㅇㅇㅇㅇㅇ', 'b1.jpg', '2024/01/18'); 
 
--productimage
select * from productimage;

insert into productimage
 values (1, 1, '메인', 'pen_Sample.jpg');
insert into productimage
 values (2, 1, '상세', 'pen_Sample.jpg');
insert into productimage
 values (3, 1, '상세', 'pen_Sample.jpg');
insert into productimage
 values (4, 1, '상세', 'pen_Sample.jpg');
insert into productimage
 values (5, 2, '메인', 'diary_sample.jpg'); 
insert into productimage
 values (6, 2, '상세', 'diary_sample.jpg'); 
insert into productimage
 values (7, 2, '상세', 'diary_sample.jpg'); 
insert into productimage
 values (8, 2, '상세', 'diary_sample.jpg');  
 
 