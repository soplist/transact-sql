use accumulate_points_DB


if exists(select * from sysobjects where name='tb_user')
   drop table tb_user
go

create table tb_user
(
   UserID int identity(1,1) primary key,
   UserName nvarchar(30),
   PassWord nvarchar(30),
   Email nvarchar(50),
   Role bit
)
go

insert into tb_user(UserName,PassWord,Email,Role) values('wangkang1','123456','soplist@hotmail.com',1);
insert into tb_user(UserName,PassWord,Email,Role) values('wangkang2','123','sopcase@yahoo.com',0);

select * from tb_user;

update tb_user set Role=1 where UserName='wangkang3';
update tb_user set Role=0 where UserName='wangkang4';