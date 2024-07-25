use schooldb;

create table tbl_users(
username varchar(20) PRIMARY KEY,
password varchar(255) not null,
name varchar(20) not null,
nick varchar(20) not null,
role varchar(10) not null	
);