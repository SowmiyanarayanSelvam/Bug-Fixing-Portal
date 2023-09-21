create database bugfixingportal;
use bugfixingportal;

create table user_details(
username varchar(20) primary key ,
name varchar(25),
password varchar(30),
date_of_birth varchar(25) default "01/01/1900",
email varchar(50) default "xyz@abc.com",
points integer default 0,
level varchar(50) default "bronze"
);

alter table user_details add column interests varchar(255) default 'just entered';
alter table user_details add column picsource varchar(200) default '';
update user_details set points=5 where name="Mithran";
update user_details set level="diamond" where name="Monisha";
select * from user_details;
truncate user_details;
drop table user_details;

alter table user_details drop picsource;

create table feedback(
username varchar(20) primary key ,
rating integer default 1,
suggestion varchar(100) default "No suggestions"
);
truncate feedback;
select * from feedback;

create table issues(
problem_id integer primary key AUTO_INCREMENT,
username varchar(20) ,
prob varchar(255),
domain varchar(250),
description varchar(255),
type varchar(50)
);

select * from issues;
truncate issues;
alter table issues add column status varchar(10) default "open";


create table sp(
email varchar(255) primary key,
username varchar(20),
pwd varchar(255)
);

select * from sp;
truncate sp;

create table interaction(problem_id integer, 
			inter_num integer, username varchar(20), 
			response varchar(300), 
            solved varchar(1) default "N", 
            primary key(problem_id, inter_num));

SET SQL_SAFE_UPDATES = 0;