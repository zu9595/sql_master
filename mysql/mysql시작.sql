use sakila;
use sys;
select * from sys_config;
-- 문자형 char 고정, varchar 가변
-- 숫자형 정수 int(4byte), bigint 실수 float, double
-- 날짜 date(YYYY-MM-DD), time(HH:mm:SS), datetime 
-- mysql
-- cast(대상 as 타입), date_format(값, 출력포맷)

use dev;

create table `customers` (
	`id` int not null auto_increment,
    `name` varchar(45) not null,
    `email` varchar(45) not null,
    `phone` varchar(45) not null,
    `address` varchar(100) null,
    primary key (`id`)
);
    
select id, 
		name, 
        email,
        phone,
        address
from customers;

desc customers;

insert into customers(
					  id,
					  name,
					  email,
					  phone,
					  address
                      )
					values(
                    1,
                    'John Doe',
                    'john@mail.com',
                    '010-000-0000',
                    ''
                    );
commit;

create user 'dev01'@'%' identified with mysql_native_password by '1234';
grant all privileges on dev.* to 'dev01'@'%' with grant option; -- 권한
flush privileges; -- 재시작없이 바로 적용

select *
from customer;