accumulate_points

create database accumulate_points_DB 
on  primary
(
   name='accumulate_points_DB_data',
   filename='D:\wk\accumulate_points_DB_data.mdf',
   size=5mb,
   maxsize=100mb,
   filegrowth=15%
)
log on
(
   name='accumulate_points_DB_log',
   filename='D:\wk\accumulate_points_log.ldf',
   size=2mb,
   filegrowth=1mb
)




use accumulate_points_DB
go
if exists(select * from sysdatabases where name='accumulate_points_DB')
   drop database accumulate_points_DB
go


use accumulate_points_DB
go
if exists(select * from sysobjects where name='user')
   drop table user
go

create table accumulate_points_DB_user
(
   no int identity(1,1) primary key,
   real_name char(20) not null
)
go

insert into accumulate_points_DB_user(real_name) values('Íõ¿µ');
insert into accumulate_points_DB_user(real_name) values('–c°²Òå');
