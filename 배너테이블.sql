--테이블 생성
CREATE TABLE banner (
	banner_name	varchar2(100)		NULL,
	banner_desc	clob		NULL,
	banner_img	varchar2(500)		NULL
);

--데이터
insert into banner
values ( '배너1', '배너1 설명입니다', 'img/chalk.png');
insert into banner
values ( '배너2', '배너2 설명입니다', 'img/C001.png');
insert into banner
values ( '배너3', '배너3 설명입니다', 'img/post_it.png');

--테이블 삭제
--drop table banner;