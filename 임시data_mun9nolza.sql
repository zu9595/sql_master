commit;

select b.* from
	(select rownum rn, a.* from
	(select * from product
	
    
    order by pro_sell
    ) a ) b
   where b.rn > (1-1)*9 and b.rn <= 1*9 and category = '陥戚嬢軒';
    
   


--member
select * from member;

insert into member
 values ('user1', '1111', '畠掩疑', '害', '010-1111-1111', 'user1@naver.com', 'user');
insert into member
 values ('user2', '2222', '戚走精', '食', '010-2222-2222', 'user2@naver.com', 'user'); 
insert into member
 values ('user3', '3333', '戚推廃', '害', '010-3333-3333', 'user3@naver.com', 'user');
insert into member
 values ('user4', '4444', '沿走慎', '食', '010-4444-4444', 'user4@naver.com', 'user'); 
insert into member
 values ('user5', '5555', '沿走精', '食', '010-5555-5555', 'user5@naver.com', 'user');  
 
--cart
select * from cart;

insert into cart
 values (3, 'user1', 1, 20000, 2); 
insert into cart
 values (4, 'user2', 3, 10000, 1);  
 
--product
select * from product;

insert into product
 values (3, '2024 是適軒', '疏焼推', 'b1.jpg', 20000, 18000, 0, 50, '陥戚嬢軒');
insert into product
 values (4, '2024 胡十軒', '疏焼推', 'b1.jpg', 28000, 25000, 0, 50, '陥戚嬢軒');
insert into product
 values (5, '2024 超鍵希', '疏焼推', 'b1.jpg', 15000, 10000, 0, 50, '超鍵希'); 

--inquire
select * from inquire;

insert into inquire
 values (1, '畠掩疑', 1, '庚税球形推', 'しししししししし', '2024/01/15', 'D001.png', '岩痕');
insert into inquire
 values (2, '戚戚戚', 1, '庚税球形推', 'しししししししし', '2024/01/15', 'D002.png', '岩痕');
insert into inquire
 values (3, '神神神', 1, '庚税球形推', 'しししししししし', '2024/01/15', 'D002.png', '岩痕');

--orderlist
select * from orderlist;

insert into orderlist 
 values (24011501, '2024/01/15', 'user1', '畠掩疑', '企姥', '含辞姥', '010-1111-1111', 13500, 3000,  '庚蒋'); 
insert into orderlist 
 values (24011504, '2024/01/15', 'user2', '戚走精', '企姥', '含辞姥', '010-2222-2222', 50000, 0, '庚蒋'); 
insert into orderlist 
 values (240115013, '2024/01/15', 'user3', '戚推廃', '企姥', '含辞姥', '010-3333-3333', 18000, 3000, '庚蒋');

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
 values (1, 24011501, 1, 'user1', '軒坂', 3,'ししししししし', 'pen_Sample.jpg', '2024/01/18');
insert into review
 values (2, 24011504, 4, 'user2', '軒坂', 5,'ししししししし', 'b1.jpg', '2024/01/18'); 
 
--productimage
select * from productimage;

insert into productimage
 values (1, 1, '五昔', 'pen_Sample.jpg');
insert into productimage
 values (2, 1, '雌室', 'pen_Sample.jpg');
insert into productimage
 values (3, 1, '雌室', 'pen_Sample.jpg');
insert into productimage
 values (4, 1, '雌室', 'pen_Sample.jpg');
insert into productimage
 values (5, 2, '五昔', 'diary_sample.jpg'); 
insert into productimage
 values (6, 2, '雌室', 'diary_sample.jpg'); 
insert into productimage
 values (7, 2, '雌室', 'diary_sample.jpg'); 
insert into productimage
 values (8, 2, '雌室', 'diary_sample.jpg');  
 
 