--1.상품
CREATE TABLE product (
	pro_code	number		primary key,
	pro_name	varchar2(100)		NULL,
	pro_desc	clob		NULL,
	pro_image	varchar2(500)		NULL,
	pro_price	number		NULL,
	pro_discount	number		NULL,
	pro_sell	number		NULL,
	pro_stock	number		NULL,
	category	varchar2(200)		NULL
);
CREATE SEQUENCE pro_code_seq;

drop table product;
drop sequence pro_code_seq;

--2.상품이미지
CREATE TABLE productimage (
    pro_code	number		NOT NULL,
	img_no	number ,
	img_prop	varchar2(200)		NULL,
	image	varchar2(500)		NULL
);
--CREATE SEQUENCE img_no_seq;

drop table productimage;
--drop sequence img_no_seq;


--3.회원
CREATE TABLE member (
	user_id	varchar2(100)		primary key,
	user_pw	varchar2(100)		NOT NULL,
	user_name	varchar2(100)	NOT NULL,
	gender	varchar2(100)		NULL,
	phone_num	varchar2(100)	NOT NULL,
	email	varchar2(100)		NULL,
	status	varchar2(100)		NULL
);
drop table member;

--4.장바구니
CREATE TABLE cart (
	mypro_no	number		primary key,
	user_id	varchar2(100)		NOT NULL,
	pro_code	number		NOT NULL,
    pro_price	number		NULL,
	pro_discount	number		NULL,
	mypro_cnt	 number		NULL
);
CREATE SEQUENCE mypro_no_seq;

drop table cart;
drop sequence mypro_no_seq;

--5.주문내역
CREATE TABLE orderlist (
	order_no	number		primary key,
	order_date	date	DEFAULT sysdate	NULL,
	user_id	varchar2(100)		NOT NULL,
	order_recipient	varchar2(100)		NULL,
	order_addr	varchar2(200)		NULL,
	detail_addr	varchar2(500)		NULL,
	order_phone	varchar2(100)		NULL,
	total_price	number		NULL,
	delivery_fee	number		DEFAULT 3000 NULL,
	delivery_memo	varchar2(500)		NULL,
    order_status varchar2(100)
);
CREATE SEQUENCE order_no_seq;

drop table orderlist;
drop sequence order_no_seq;

--6.주문상세
CREATE TABLE orderdetail (
	order_no	number,
    pro_code	number,
	de_pro_cnt	number		NULL,
	de_pro_price	number		NULL,
    
    CONSTRAINT CLASS_PK PRIMARY KEY(order_no, pro_code)
);
drop table orderdetail;

--7.문의내역
CREATE TABLE inquire (
	inq_no	number		primary key,
	user_id	varchar2(100)		NOT NULL,
	pro_code	number		NOT NULL,
	inq_title	varchar2(200)		NULL,
	inq_content	varchar2(500)		NULL,
	inq_date	date		NULL,
	inq_img	varchar2(300)		NULL,
	answer	varchar2(300)		NULL
);
CREATE SEQUENCE inq_no_seq;

drop table inquire;
drop sequence inq_no_seq;

--8.상품리뷰
CREATE TABLE review (
	re_no	number		primary key,
	order_no	number		NULL,
	pro_code	number		NOT NULL,
	user_id	varchar2(100)		NULL,
	re_title	varchar2(100)		NULL,
	re_rate	number		NULL,
	re_content	 varchar2(500)		NULL,
	re_image	varchar2(100)		NULL,
	re_date	date	DEFAULT sysdate	NULL
);
CREATE SEQUENCE re_no_seq;

drop table review;
drop sequence re_no_seq;

--9.메인배너
CREATE TABLE banner (
	banner_name	varchar2(100)		NULL,
	banner_desc	clob		NULL,
	banner_img	varchar2(500)		NULL
);
drop table banner;



