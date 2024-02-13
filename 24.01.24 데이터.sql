--3.회원 member
select * from member;
commit;
insert into member
 values ('user1', '111111', '홍길동', '남', '010-1111-1111', 'user1@naver.com', 'user');
insert into member
 values ('user2', '222222', '이지은', '여', '010-2222-2222', 'user2@naver.com', 'user'); 
insert into member
 values ('user3', '333333', '이요한', '남', '010-3333-3333', 'user3@naver.com', 'user');
insert into member
 values ('user4', '444444', '김지영', '여', '010-4444-4444', 'user4@naver.com', 'user'); 
insert into member
 values ('user5', '555555', '이하늘', '남', '010-5555-5555', 'user5@naver.com', 'user');
insert into member
 values ('user6', '666666', '김지은', '여', '010-6666-6666', 'admin1@naver.com', 'admin'); 
 
--4.장바구니 cart
select * from cart;
commit;

insert into cart
 values (mypro_no_seq.nextval, 'user1', 1, 3000, 2550, 2); 
insert into cart
 values (mypro_no_seq.nextval, 'user1', 2, 3500, 3000, 1);  

--5.주문내역 orderlist
select * from orderlist;

--배송비 입력X(기본3000적용)
insert into orderlist (order_no, order_date, user_id, order_recipient, order_addr, detail_addr, order_phone, total_price, delivery_memo, order_status)
 values (order_no_seq.nextval, '2024-01-19', 'user1', '홍길동', '대구 중구', '남일동 135-1', '010-1111-1111', 30000, '문앞', '배송완료');--3인덱스접착 10건 
--배송비 0원
insert into orderlist 
 values (order_no_seq.nextval, '2024-01-20', 'user1', '홍길동', '대구 중구', '남일동 135-1', '010-1111-1111', 55500, 0, '문앞', '배송준비중'); --상품1,2 10건씩
insert into orderlist 
 values (order_no_seq.nextval, '2024-01-21', 'user1', '홍길동', '대구 중구', '남일동 135-1', '010-1111-1111', 60000, 0, '문앞', '배송중'); --4플라워 15건
--가입 후 탈퇴할 회원 user7
insert into orderlist (order_no, order_date, user_id, order_recipient, order_addr, detail_addr, order_phone, total_price, delivery_memo, order_status)
 values (order_no_seq.nextval, '2024-01-19', 'user7', '이주은', '대구 중구', '남일동 135-1', '010-7777-7777', 30000, '문앞', '배송완료');--3인덱스접착 10건 
insert into orderlist 
 values (order_no_seq.nextval, '2024-01-20', 'user7', '이주은', '대구 중구', '남일동 135-1', '010-7777-7777', 55500, 0, '문앞', '배송준비중'); --상품1,2 10건씩
insert into orderlist 
 values (order_no_seq.nextval, '2024-01-21', 'user7', '이주은', '대구 중구', '남일동 135-1', '010-7777-7777', 60000, 0, '문앞', '배송중'); --4플라워 15건


--6.주문상세 orderdetail
select * from orderdetail;
select * from orderlist;
select * from product;
--(order_no, pro_code, de_pro_cnt, de_pro_price)

--홍길동
--1 | 24.01.19 | 3 인덱스접착 | 10건 구매 
insert into orderdetail values (1, 3, 10, 30000);
--2 | 24.01.20 | 상품1,2 | 10건씩 
insert into orderdetail values (2, 1, 10, 25500);--1.썸네일
insert into orderdetail values (2, 2, 10, 30000); --2.다꾸
--3 | 24.01.21 | 4 플라워 | 15건
insert into orderdetail values (3, 4, 15, 60000);

--이주은
--1 | 24.01.19 | 3 인덱스접착 | 10건 구매 
insert into orderdetail values (4, 3, 10, 30000);
--2 | 24.01.20 | 상품1,2 | 10건씩 
insert into orderdetail values (5, 1, 10, 25500);--1.썸네일
insert into orderdetail values (5, 2, 10, 30000); --2.다꾸
--3 | 24.01.21 | 4 플라워 | 15건
insert into orderdetail values (6, 4, 15, 60000);


--7.문의내역 inquire
select * from inquire;

insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user1', 97, '문의드려요', '사이즈가 어떻게 되나요?', '2024/01/15', '노트001.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user2', 1, '썸네일 인덱스 잇 문의', '하늘 색상 재입고 문의드려요', '2024/01/15', '메모지1.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user1', 3, '인덱스 접착 메모지 문의드려요', '접착력이 강한가요', '2024/01/16', '메모지3.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user3', 126, '30DAYS MASKING TAPE', '마스킹 테이프 구름 모양 재입고 문의', '2024/01/16', '테이프010.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user1', 2, '다꾸 배경 메모지 문의', '배송기간은 어떻게 되나요?', '2024/01/16', '메모지2.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user4', 8, '문의드려요', '사이즈 문의드려요', '2024/01/17', '메모지8.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user4', 7, '문의남깁니다', '파도무늬 재입고 언제 되는 건가요', '2024/01/17', '메모지7.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user2', 17, '베어베어 문의', '하늘 베어 재입고 예정이신가요?', '2024/01/19', '메모지17.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user5', 97, '노트 색상 문의', '라임색 출시는 언제쯤 되나요', '2024/01/19', '노트001.jpg'); 

--user7이주은
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user7', 3, '인덱스 접착 메모지 문의드려요', '접착력이 강한가요', '2024/01/16', '메모지3.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user7', 126, '30DAYS MASKING TAPE', '마스킹 테이프 구름 모양 재입고 문의', '2024/01/16', '테이프010.jpg');
 insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user7', 17, '베어베어 문의', '하늘 베어 재입고 예정이신가요?', '2024/01/19', '메모지17.jpg');
 
--8.상품리뷰 review
select * from review;

insert into review
 values (re_no_seq.nextval, 1, 3, 'user1', '리뷰 남겨요!', 5, '깔끔하고 색상까지 다 좋습니다 :)', '메모지3.jpg', '2024/01/20');
insert into review
 values (re_no_seq.nextval, 2, 2, 'user1', '다꾸 배경 메모지 리뷰', 5, '크기도 적당하고 무늬도 예쁘고 다 마음에 들어요', '메모지2.jpg', '2024/01/22');
insert into review
 values (re_no_seq.nextval, 2, 1, 'user1', '썸네일 인덱스 잇 리뷰 남겨요', 5, '마음에 들어서 다음에는 다른 색상도 구매할 예정입니다!', '메모지1.jpg', '2024/01/22');
--user7
insert into review
 values (re_no_seq.nextval, 4, 3, 'user7', '리뷰 남겨요!', 5, '깔끔하고 색상까지 다 좋습니다 :)', '메모지3.jpg', '2024/01/20');
insert into review
 values (re_no_seq.nextval, 5, 2, 'user7', '다꾸 배경 메모지 리뷰', 5, '크기도 적당하고 무늬도 예쁘고 다 마음에 들어요', '메모지2.jpg', '2024/01/22');
insert into review
 values (re_no_seq.nextval, 5, 1, 'user7', '썸네일 인덱스 잇 리뷰 남겨요', 5, '마음에 들어서 다음에는 다른 색상도 구매할 예정입니다!', '메모지1.jpg', '2024/01/22');


--9.메인배너 banner
select * from banner;

insert into banner
values ( '배너1', '배너1 설명입니다', 'img/chalk.png');
insert into banner
values ( '배너2', '배너2 설명입니다', 'img/C001.png');
insert into banner
values ( '배너3', '배너3 설명입니다', 'img/post_it.png');

--
commit;
 