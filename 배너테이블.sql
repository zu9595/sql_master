--���̺� ����
CREATE TABLE banner (
	banner_name	varchar2(100)		NULL,
	banner_desc	clob		NULL,
	banner_img	varchar2(500)		NULL
);

--������
insert into banner
values ( '���1', '���1 �����Դϴ�', 'img/chalk.png');
insert into banner
values ( '���2', '���2 �����Դϴ�', 'img/C001.png');
insert into banner
values ( '���3', '���3 �����Դϴ�', 'img/post_it.png');

--���̺� ����
--drop table banner;