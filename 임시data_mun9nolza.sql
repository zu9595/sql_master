commit;

--member
select * from member;

insert into member
 values ('user1', '1111', 'ȫ�浿', '��', '010-1111-1111', 'user1@naver.com', 'user');
insert into member
 values ('user2', '2222', '������', '��', '010-2222-2222', 'user2@naver.com', 'user'); 
insert into member
 values ('user3', '3333', '�̿���', '��', '010-3333-3333', 'user3@naver.com', 'user');
insert into member
 values ('user4', '4444', '������', '��', '010-4444-4444', 'user4@naver.com', 'user'); 
insert into member
 values ('user5', '5555', '������', '��', '010-5555-5555', 'user5@naver.com', 'user');  
 
--cart
select * from cart;

insert into cart
 values (3, 'user1', 1, 20000, 2); 
insert into cart
 values (4, 'user2', 3, 10000, 1);  
 
--product
select * from product;

insert into product
 values (3, '2024 ��Ŭ��', '���ƿ�', 'b1.jpg', 20000, 18000, 0, 50, '���̾');
insert into product
 values (4, '2024 �ս���', '���ƿ�', 'b1.jpg', 28000, 25000, 0, 50, '���̾');
insert into product
 values (5, '2024 Ķ����', '���ƿ�', 'b1.jpg', 15000, 10000, 0, 50, 'Ķ����'); 

--inquire
select * from inquire;

insert into inquire
 values (1, 'ȫ�浿', 1, '���ǵ����', '����������������', '2024/01/15', 'D001.png', '�亯');
insert into inquire
 values (2, '������', 1, '���ǵ����', '����������������', '2024/01/15', 'D002.png', '�亯');
insert into inquire
 values (3, '������', 1, '���ǵ����', '����������������', '2024/01/15', 'D002.png', '�亯');

--orderlist
select * from orderlist;

insert into orderlist 
 values (24011501, '2024/01/15', 'user1', 'ȫ�浿', '�뱸', '�޼���', '010-1111-1111', 13500, 3000,  '����'); 
insert into orderlist 
 values (24011504, '2024/01/15', 'user2', '������', '�뱸', '�޼���', '010-2222-2222', 50000, 0, '����'); 
insert into orderlist 
 values (240115013, '2024/01/15', 'user3', '�̿���', '�뱸', '�޼���', '010-3333-3333', 18000, 3000, '����');

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
 values (1, 24011501, 1, 'user1', '����', 3,'��������������', 'pen_Sample.jpg', '2024/01/18');
insert into review
 values (2, 24011504, 4, 'user2', '����', 5,'��������������', 'b1.jpg', '2024/01/18'); 
 
--productimage
select * from productimage;

insert into productimage
 values (1, 1, '����', 'pen_Sample.jpg');
insert into productimage
 values (2, 1, '��', 'pen_Sample.jpg');
insert into productimage
 values (3, 1, '��', 'pen_Sample.jpg');
insert into productimage
 values (4, 1, '��', 'pen_Sample.jpg');
insert into productimage
 values (5, 2, '����', 'diary_sample.jpg'); 
insert into productimage
 values (6, 2, '��', 'diary_sample.jpg'); 
insert into productimage
 values (7, 2, '��', 'diary_sample.jpg'); 
insert into productimage
 values (8, 2, '��', 'diary_sample.jpg');  
 
 