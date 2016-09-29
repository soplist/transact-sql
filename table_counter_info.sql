use accumulate_points_DB


if exists(select * from sysobjects where name='tb_CounterInfo')
   drop table tb_CounterInfo
go

create table tb_CounterInfo
(
   ID int identity(1,1) primary key,
   IP varchar,
   LoginTime datetime,
   LeaveTime datetime,
   Browser varchar,
   OS varchar
)
go