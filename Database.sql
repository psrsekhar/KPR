create database IF NOT EXISTS movies;
show databases;
use movies;

create table IF NOT EXISTS movies.info(
id int not null,
title text not null,
cast text null,
release_date date null,
director tinytext not null,
censor char(3) null,
rating decimal (4,2)
);

show tables;
desc movies.info;

insert into movies.info (id, title, director) 
values (1, "Coolie", "Lokesh Kanakaraj");

insert into movies.info values 
(2, "Jailer", "Rajnikanth, Tamanna, Yogi Babu", '2023-08-10',
"Nelson", "U/A", 0);

insert into movies.info values 
(3, "Leo", "Vijay, Trisha", '2023-10-18',
"Lokesh Kanakaraj", "U/A", 0),
(4, "Sivaji", "Rajnikanth, Shreya", '2009-08-10',
"Shankar", "U/A", 0);


select * from movies.info;

alter table movies.info modify column id int auto_increment not null primary key;

insert into movies.info (title, cast, release_date, director, censor, rating)  values 
("Avengers", "Chris Evans, RDJ, Tom Holland", '2023-08-10',
"Nelson", "U/A", 0);

create table if not exists movies.ott(
	id int auto_increment not null primary key,
	name text not null
);

insert into movies.ott (name) Values 
("Amazon"),("Netflix"),("HotStar"),("Youtube");

alter table movies.info add column ott_id int not null default 2;

select * from movies.ott;

drop table if exists movies.ott;

drop database if exists movies;

alter database movies CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;















