--테이블생성

--회원
CREATE TABLE member (
	user_id	varchar2(100)		primary key,
	user_pw	varchar2(100)		NOT NULL,
	user_name	varchar2(100)		NOT NULL,
	gender	varchar2(100)		NULL,
	phone_num	varchar2(100)		NULL,
	email	varchar2(100)		NULL,
    addr varchar2(100)          NULL,
    detail_addr varchar2(200)   NULL,
	status	varchar2(100)		NULL
);
drop table member;

--장바구니
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

--상품
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

--문의
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

--주문내역
CREATE TABLE orderlist (
	order_no	number		primary key,
	order_date	date	DEFAULT sysdate	NULL,
    pro_code number,
	user_id	varchar2(100)		NOT NULL,
	order_recipient	varchar2(100)		NULL,
	order_addr	varchar2(200)		NULL,
	detail_addr	varchar2(500)		NULL,
	order_phone	varchar2(100)		NULL,
	total_price	number		NULL,
	delivery_fee	number		NULL,
	delivery_memo	varchar2(500)		NULL,
    order_status varchar2(100)
);
CREATE SEQUENCE order_no_seq;

drop table orderlist;
drop sequence order_no_seq;

--주문상세
CREATE TABLE orderdetail (
	pro_code	number		primary key,
	order_no	number		NULL,
	de_pro_cnt	number		NULL,
	de_pro_price	number		NULL
);
drop table orderdetail;

--상품리뷰
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

--상품이미지
CREATE TABLE productimage (
	img_no	number		primary key,
	pro_code	number		NOT NULL,
	img_prop	varchar2(200)		NULL,
	image	varchar2(500)		NULL
);
CREATE SEQUENCE img_no_seq;

drop table productimage;
drop sequence img_no_seq;

--배너테이블
CREATE TABLE banner (
	banner_name	varchar2(100)		NULL,
	banner_desc	clob		NULL,
	banner_img	varchar2(500)		NULL
);

--
commit;



--테이블 생성 때 기본키만 설정해서 생성 완료.

-----아래부분은 실행 안 함 XXXXXX--
ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	user_id
);

ALTER TABLE myproduct ADD CONSTRAINT PK_MYPRODUCT PRIMARY KEY (
	mypro_no,
	user_id,
	pro_code
);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	pro_code
);

ALTER TABLE inquire ADD CONSTRAINT PK_INQUIRE PRIMARY KEY (
	inq_no,
	user_id,
	pro_code
);

ALTER TABLE orderlist ADD CONSTRAINT PK_ORDERLIST PRIMARY KEY (
	order_no
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	re_no,
	order_no,
	pro_code
);

ALTER TABLE productimage ADD CONSTRAINT PK_PRODUCTIMAGE PRIMARY KEY (
	img_no,
	pro_code
);

ALTER TABLE orderdetail ADD CONSTRAINT PK_ORDERDETAIL PRIMARY KEY (
	pro_code,
	order_no
);

ALTER TABLE myproduct ADD CONSTRAINT FK_member_TO_myproduct_1 FOREIGN KEY (
	user_id
)
REFERENCES member (
	user_id
);

ALTER TABLE myproduct ADD CONSTRAINT FK_product_TO_myproduct_1 FOREIGN KEY (
	pro_code
)
REFERENCES product (
	pro_code
);

ALTER TABLE inquire ADD CONSTRAINT FK_member_TO_inquire_1 FOREIGN KEY (
	user_id
)
REFERENCES member (
	user_id
);

ALTER TABLE inquire ADD CONSTRAINT FK_product_TO_inquire_1 FOREIGN KEY (
	pro_code
)
REFERENCES product (
	pro_code
);

ALTER TABLE orderlist ADD CONSTRAINT FK_member_TO_orderlist_1 FOREIGN KEY (
	user_id
)
REFERENCES member (
	user_id
);

ALTER TABLE review ADD CONSTRAINT FK_orderdetail_TO_review_1 FOREIGN KEY (
	order_no
)
REFERENCES orderdetail (
	order_no
);

ALTER TABLE review ADD CONSTRAINT FK_orderdetail_TO_review_2 FOREIGN KEY (
	pro_code
)
REFERENCES orderdetail (
	pro_code
);

ALTER TABLE productimage ADD CONSTRAINT FK_product_TO_productimage_1 FOREIGN KEY (
	pro_code
)
REFERENCES product (
	pro_code
);

ALTER TABLE orderdetail ADD CONSTRAINT FK_orderlist_TO_orderdetail_1 FOREIGN KEY (
	order_no
)
REFERENCES orderlist (
	order_no
);