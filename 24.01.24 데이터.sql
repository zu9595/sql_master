--3.ȸ�� member
select * from member;
commit;
insert into member
 values ('user1', '111111', 'ȫ�浿', '��', '010-1111-1111', 'user1@naver.com', 'user');
insert into member
 values ('user2', '222222', '������', '��', '010-2222-2222', 'user2@naver.com', 'user'); 
insert into member
 values ('user3', '333333', '�̿���', '��', '010-3333-3333', 'user3@naver.com', 'user');
insert into member
 values ('user4', '444444', '������', '��', '010-4444-4444', 'user4@naver.com', 'user'); 
insert into member
 values ('user5', '555555', '���ϴ�', '��', '010-5555-5555', 'user5@naver.com', 'user');
insert into member
 values ('user6', '666666', '������', '��', '010-6666-6666', 'admin1@naver.com', 'admin'); 
 
--4.��ٱ��� cart
select * from cart;
commit;

insert into cart
 values (mypro_no_seq.nextval, 'user1', 1, 3000, 2550, 2); 
insert into cart
 values (mypro_no_seq.nextval, 'user1', 2, 3500, 3000, 1);  

--5.�ֹ����� orderlist
select * from orderlist;

--��ۺ� �Է�X(�⺻3000����)
insert into orderlist (order_no, order_date, user_id, order_recipient, order_addr, detail_addr, order_phone, total_price, delivery_memo, order_status)
 values (order_no_seq.nextval, '2024-01-19', 'user1', 'ȫ�浿', '�뱸 �߱�', '���ϵ� 135-1', '010-1111-1111', 30000, '����', '��ۿϷ�');--3�ε������� 10�� 
--��ۺ� 0��
insert into orderlist 
 values (order_no_seq.nextval, '2024-01-20', 'user1', 'ȫ�浿', '�뱸 �߱�', '���ϵ� 135-1', '010-1111-1111', 55500, 0, '����', '����غ���'); --��ǰ1,2 10�Ǿ�
insert into orderlist 
 values (order_no_seq.nextval, '2024-01-21', 'user1', 'ȫ�浿', '�뱸 �߱�', '���ϵ� 135-1', '010-1111-1111', 60000, 0, '����', '�����'); --4�ö�� 15��
--���� �� Ż���� ȸ�� user7
insert into orderlist (order_no, order_date, user_id, order_recipient, order_addr, detail_addr, order_phone, total_price, delivery_memo, order_status)
 values (order_no_seq.nextval, '2024-01-19', 'user7', '������', '�뱸 �߱�', '���ϵ� 135-1', '010-7777-7777', 30000, '����', '��ۿϷ�');--3�ε������� 10�� 
insert into orderlist 
 values (order_no_seq.nextval, '2024-01-20', 'user7', '������', '�뱸 �߱�', '���ϵ� 135-1', '010-7777-7777', 55500, 0, '����', '����غ���'); --��ǰ1,2 10�Ǿ�
insert into orderlist 
 values (order_no_seq.nextval, '2024-01-21', 'user7', '������', '�뱸 �߱�', '���ϵ� 135-1', '010-7777-7777', 60000, 0, '����', '�����'); --4�ö�� 15��


--6.�ֹ��� orderdetail
select * from orderdetail;
select * from orderlist;
select * from product;
--(order_no, pro_code, de_pro_cnt, de_pro_price)

--ȫ�浿
--1 | 24.01.19 | 3 �ε������� | 10�� ���� 
insert into orderdetail values (1, 3, 10, 30000);
--2 | 24.01.20 | ��ǰ1,2 | 10�Ǿ� 
insert into orderdetail values (2, 1, 10, 25500);--1.�����
insert into orderdetail values (2, 2, 10, 30000); --2.�ٲ�
--3 | 24.01.21 | 4 �ö�� | 15��
insert into orderdetail values (3, 4, 15, 60000);

--������
--1 | 24.01.19 | 3 �ε������� | 10�� ���� 
insert into orderdetail values (4, 3, 10, 30000);
--2 | 24.01.20 | ��ǰ1,2 | 10�Ǿ� 
insert into orderdetail values (5, 1, 10, 25500);--1.�����
insert into orderdetail values (5, 2, 10, 30000); --2.�ٲ�
--3 | 24.01.21 | 4 �ö�� | 15��
insert into orderdetail values (6, 4, 15, 60000);


--7.���ǳ��� inquire
select * from inquire;

insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user1', 97, '���ǵ����', '����� ��� �ǳ���?', '2024/01/15', '��Ʈ001.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user2', 1, '����� �ε��� �� ����', '�ϴ� ���� ���԰� ���ǵ����', '2024/01/15', '�޸���1.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user1', 3, '�ε��� ���� �޸��� ���ǵ����', '�������� ���Ѱ���', '2024/01/16', '�޸���3.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user3', 126, '30DAYS MASKING TAPE', '����ŷ ������ ���� ��� ���԰� ����', '2024/01/16', '������010.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user1', 2, '�ٲ� ��� �޸��� ����', '��۱Ⱓ�� ��� �ǳ���?', '2024/01/16', '�޸���2.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user4', 8, '���ǵ����', '������ ���ǵ����', '2024/01/17', '�޸���8.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user4', 7, '���ǳ���ϴ�', '�ĵ����� ���԰� ���� �Ǵ� �ǰ���', '2024/01/17', '�޸���7.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user2', 17, '����� ����', '�ϴ� ���� ���԰� �����̽Ű���?', '2024/01/19', '�޸���17.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user5', 97, '��Ʈ ���� ����', '���ӻ� ��ô� ������ �ǳ���', '2024/01/19', '��Ʈ001.jpg'); 

--user7������
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user7', 3, '�ε��� ���� �޸��� ���ǵ����', '�������� ���Ѱ���', '2024/01/16', '�޸���3.jpg');
insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user7', 126, '30DAYS MASKING TAPE', '����ŷ ������ ���� ��� ���԰� ����', '2024/01/16', '������010.jpg');
 insert into inquire (inq_no, user_id, pro_code, inq_title, inq_content, inq_date, inq_img)
 values (inq_no_seq.nextval, 'user7', 17, '����� ����', '�ϴ� ���� ���԰� �����̽Ű���?', '2024/01/19', '�޸���17.jpg');
 
--8.��ǰ���� review
select * from review;

insert into review
 values (re_no_seq.nextval, 1, 3, 'user1', '���� ���ܿ�!', 5, '����ϰ� ������� �� �����ϴ� :)', '�޸���3.jpg', '2024/01/20');
insert into review
 values (re_no_seq.nextval, 2, 2, 'user1', '�ٲ� ��� �޸��� ����', 5, 'ũ�⵵ �����ϰ� ���̵� ���ڰ� �� ������ ����', '�޸���2.jpg', '2024/01/22');
insert into review
 values (re_no_seq.nextval, 2, 1, 'user1', '����� �ε��� �� ���� ���ܿ�', 5, '������ �� �������� �ٸ� ���� ������ �����Դϴ�!', '�޸���1.jpg', '2024/01/22');
--user7
insert into review
 values (re_no_seq.nextval, 4, 3, 'user7', '���� ���ܿ�!', 5, '����ϰ� ������� �� �����ϴ� :)', '�޸���3.jpg', '2024/01/20');
insert into review
 values (re_no_seq.nextval, 5, 2, 'user7', '�ٲ� ��� �޸��� ����', 5, 'ũ�⵵ �����ϰ� ���̵� ���ڰ� �� ������ ����', '�޸���2.jpg', '2024/01/22');
insert into review
 values (re_no_seq.nextval, 5, 1, 'user7', '����� �ε��� �� ���� ���ܿ�', 5, '������ �� �������� �ٸ� ���� ������ �����Դϴ�!', '�޸���1.jpg', '2024/01/22');


--9.���ι�� banner
select * from banner;

insert into banner
values ( '���1', '���1 �����Դϴ�', 'img/chalk.png');
insert into banner
values ( '���2', '���2 �����Դϴ�', 'img/C001.png');
insert into banner
values ( '���3', '���3 �����Դϴ�', 'img/post_it.png');

--
commit;
 