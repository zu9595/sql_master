alter user mun9pjt
identified by mun9pjt --비밀번호
default tablespace users
temporary tablespace temp
account unlock;

create user mun9pjt
identified by mun9pjt;

grant create session, create table, create view
to mun9pjt;

revoke create session, create table, create view
from mun9pjt;

create user mun9pjt
identified by mun9pjt
default tablespace users
temporary tablespace temp;

drop user mun9pjt;

--------------------------------
alter user mun9pjt identified by mun9pjt
default tablespace users;

grant connect, resource to mun9pjt;