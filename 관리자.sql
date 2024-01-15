alter user dev
identified by dev
account unlock;

create user mun9test
identified by mun9test;

grant create session, create table, create view
to dev;

revoke create session, create table, create view
from dev;

create user dev
identified by dev
default tablespace users
temporary tablespace temp;

----------------------------------------------
create user mun9test identified by mun9test
default tablespace users;
grant connect, resource to mun9test;
