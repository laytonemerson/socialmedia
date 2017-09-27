create database smdb;

create table users (
 user_name         varchar(15) not null primary key,
 user_pass         varchar(15) not null,
 email_addr        varchar(60) not null,
 first_name        varchar(15) not null,
 last_name         varchar(20) not null,
 phone_num         varchar(10) not null 
);

create table user_roles (
 user_name         varchar(15) not null,
 role_name         varchar(15) not null,
 primary key (user_name, role_name)
);

create table friend_list (
 user_name         varchar(15) not null,
 friend_user_name  varchar(15) not null,
 start_date        date,
 primary key (user_name, friend_user_name)
);

create table movie_list (
