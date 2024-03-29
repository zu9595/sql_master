
--member
select * from member;

insert into member
 values ('user1', '1111', '畠掩疑', '害', '010-1111-1111', 'user1@naver.com', '企姥', '含辞姥', 'user');
insert into member
 values ('user2', '2222', '戚走精', '食', '010-2222-2222', 'user2@naver.com', '企姥', '含辞姥', 'user'); 
insert into member
 values ('user3', '3333', '戚推廃', '害', '010-3333-3333', 'user3@naver.com', '企姥', '含辞姥', 'user');
insert into member
 values ('user4', '4444', '沿走慎', '食', '010-4444-4444', 'user4@naver.com', '企姥', '含辞姥', 'user'); 
insert into member
 values ('user5', '5555', '沿走精', '食', '010-5555-5555', 'user5@naver.com', '企姥', '含辞姥', 'user');  
 
 
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
 values (pro_code_seq.nextval, '2024 是適軒', '疏焼推', 'b2.jpg', 20000, 18000, 0, 50, '陥戚嬢軒');
insert into product
 values (pro_code_seq.nextval, '2024 是適軒', '疏焼推', 'b1.jpg', 20000, 18000, 0, 50, '陥戚嬢軒');
insert into product
 values (pro_code_seq.nextval, '2024 胡十軒', '疏焼推', 'b1.jpg', 28000, 25000, 0, 50, '陥戚嬢軒');
insert into product
 values (pro_code_seq.nextval, '2024 超鍵希', '疏焼推', 'b1.jpg', 15000, 10000, 0, 50, '超鍵希'); 

--inquire
select * from inquire;

insert into inquire
 values (inq_no_seq.nextval, '畠掩疑', 1, '庚税球形推', 'しししししししし', '2024/01/15', 'D001.png', '岩痕');
insert into inquire
 values (inq_no_seq.nextval, '沿政層', 1, '庚税球形推', 'しししししししし', '2024/01/15', 'D002.png', '岩痕');
insert into inquire
 values (inq_no_seq.nextval, '神爽畠', 1, '庚税球形推', 'しししししししし', '2024/01/15', 'D002.png', '岩痕');

--orderlist
select * from orderlist;

insert into orderlist 
 values (order_no_seq.nextval, '2024/01/15', 1, 'user1', '畠掩疑', '企姥', '含辞姥', '010-1111-1111', 13500, 3000,  '庚蒋', '壕勺掻'); 
insert into orderlist 
 values (order_no_seq.nextval, '2024/01/15', 4, 'user2', '戚走精', '企姥', '含辞姥', '010-2222-2222', 50000, 0, '庚蒋', '壕勺刃戟'); 
insert into orderlist 
 values (order_no_seq.nextval, '2024/01/15', 3, 'user3', '戚推廃', '企姥', '含辞姥', '010-3333-3333', 18000, 3000, '庚蒋', '壕勺層搾掻');
insert into orderlist 
 values (order_no_seq.nextval, '2024/01/14', 3, 'user1', '畠掩疑', '企姥', '含辞姥', '010-1111-1111', 18000, 3000, '庚蒋', '壕勺層搾掻'); 

--orderdetail
select * from orderdetail;

insert into orderdetail values (24011501, 1, 5, 13500);
insert into orderdetail values (24011504, 4, 2, 50000);
insert into orderdetail values (24011503, 3, 1, 18000);
insert into orderdetail values (24011403, 3, 1, 18000);

 
--review
select * from review;

insert into review
 values (re_no_seq.nextval, 24011501, 1, 'user1', '軒坂', 3,'ししししししし', 'pen_Sample.jpg', '2024/01/18');
insert into review
 values (re_no_seq.nextval, 24011504, 4, 'user2', '軒坂', 5,'ししししししし', 'b1.jpg', '2024/01/18'); 
 
--productimage
select * from productimage;

insert into productimage
 values (img_no_seq.nextval, 1, '五昔', 'pen_Sample.jpg');
insert into productimage
 values (img_no_seq.nextval, 1, '雌室', 'pen_Sample.jpg');
insert into productimage
 values (img_no_seq.nextval, 1, '雌室', 'pen_Sample.jpg');
insert into productimage
 values (img_no_seq.nextval, 1, '雌室', 'pen_Sample.jpg');
insert into productimage
 values (img_no_seq.nextval, 2, '五昔', 'diary_sample.jpg'); 
insert into productimage
 values (img_no_seq.nextval, 2, '雌室', 'diary_sample.jpg'); 
insert into productimage
 values (img_no_seq.nextval, 2, '雌室', 'diary_sample.jpg'); 
insert into productimage
 values (img_no_seq.nextval, 2, '雌室', 'diary_sample.jpg');  

--banner
select * from banner;

insert into banner
values ( '壕格1', '壕格1 竺誤脊艦陥', 'img/chalk.png');
insert into banner
values ( '壕格2', '壕格2 竺誤脊艦陥', 'img/C001.png');
insert into banner
values ( '壕格3', '壕格3 竺誤脊艦陥', 'img/post_it.png');

--
commit;
 