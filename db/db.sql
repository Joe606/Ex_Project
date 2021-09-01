#postgresql
CREATE DATABASE mydb;
# \l
# \c mydb
create table vm1(id int primary key not null, name char(10) not null, memory int not null);
create table sto1(id int primary key not null, name char(10) not null, storage int not null, out_id int references vm1(id));
# \d
# \d vm1
insert into vm1(id, name, memory) values(1, 'no_a', 16);
# select * from vm1;