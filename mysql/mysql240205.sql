use dev;

create table `t_users`(
	`user_no` int auto_increment,
    `user_id` varchar(100) not null unique,
    `user_pwd` varchar(100) not null,
	`user_name` varchar(100) not null,
    `user_gender` char(1) check(user_gender in ('M', 'F')),
    `user_age` int,
    `join_date` date,
    primary key(`user_no`)
);

alter table t_users
drop column `user_id`;

alter table t_users
add column `user_id` varchar(100) not null unique;

alter table t_users
add constraint t_user_id_uni unique(`user_id`);

drop table t_users;
select * from t_users;

desc t_users;

UPDATE `dev`.`t_users` SET `join_date` = null WHERE (`user_no` = '2');
commit;