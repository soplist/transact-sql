use accumulate_points_DB


if exists(select * from sysobjects where name='tb_CounterInfo')
   drop table tb_CounterInfo
go

create table tb_CounterInfo
(
   ID int identity(1,1) primary key,
   IP varchar(50),
   LoginTime datetime,
   LeaveTime datetime,
   Browser varchar(20),
   OS varchar(20)
)
go

insert into tb_CounterInfo(IP,LoginTime,LeaveTime,Browser,OS) values('127.0.0.1','2016/9/30 8:43:27','2016/9/30 8:44:56','Firefox','WinNT');