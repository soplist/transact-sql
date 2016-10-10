create database points_management_DB 
on  primary
(
   name='points_management_DB_data',
   filename='D:\wk\points_management_DB_data.mdf',
   size=5mb,
   filegrowth=15%
)
log on
(
   name='points_management_DB_log',
   filename='D:\wk\points_management_DB_log.ldf',
   size=2mb,
   filegrowth=1mb
)

use points_management_DB
go
if exists(select * from sysobjects where name='points_management_DB_user')
   drop table points_management_DB_user
go

create table points_management_DB_user
(
   no int identity(1,1) primary key,
   username nvarchar(20) not null,
   passowrd nvarchar(20) not null,
   department_id int not null,
   role bit
)
go

if exists(select * from sysobjects where name='points_management_DB_department')
   drop table points_management_DB_department
go

create table points_management_DB_department
(
   no int identity(1,1) primary key,
   department_name nvarchar(20) not null,
)
go

alter table points_management_DB_user add constraint fk_department_id foreign key (department_id) references points_management_DB_department(no);

insert into points_management_DB_department(department_name) values('财务部');
insert into points_management_DB_department(department_name) values('业务部');
insert into points_management_DB_department(department_name) values('综合部');
insert into points_management_DB_department(department_name) values('研发部');

insert into points_management_DB_user(username,passowrd,department_id,role) values('wangkang','123456',4,1);
insert into points_management_DB_user(username,passowrd,department_id,role) values('zhengbin','123456',3,1);