drop database testlib;
create table guestbook(visitor varchar(40),comments text,entrydate datetime)

create table visitlog(visitor varchar(40),numvisits int)

create table opinion(visitor varchar(40),good bit)

create table visitorlog(visitor varchar(40),arrivaltime datetime,departuretime datetime)

create table empty(empty1 char(40) null,empty2 int null)

create table addresses
(
street varchar(60) null,
city varchar(40) null,
state varchar(20) null,
zip varchar(20) null,
country varchar(30) default 'USA'
)

create table doc_test(column_a int);
go
alter table doc_test add column_b varchar(20) null;
go
exec sp_help doc_test;
go

alter table doc_test drop column column_b;
go
exec sp_help doc_test;
go
drop table doc_test;
go

create table doc_test(column_a int);
go
insert into doc_test(column_a) values(10);
go
alter table doc_test alter column column_a decimal (5,2);
go
exec sp_help doc_test;

if OBJECT_ID('dbo.ttable','U') is not null
drop table dbo.ttable;
go
create table dbo.ttable
(
ID int primary key,
Name nvarchar(50),
CreditRating tinyint
)
go
alter table dbo.ttable add constraint CK_ttable_CreditRating check(CreditRating>=1 and CreditRating<=5)

exec sp_help;

exec sp_help doc_test;

create table tabletest
(
PriKey int,
_name varchar(30)
);
insert into tabletest(PriKey,_name) values(123,'this is a test')
go
select * from tabletest;

select PriKey,_name into dbo.abc from tabletest

select * from abc;

use [transact-sql-test]
select * from TestMoney;
update TestMoney set colb=colb*2;

if OBJECT_ID('dbo.Table1','U') is not null
drop table dbo.Table1;
go
if OBJECT_ID('dbo.Table2','U') is not null
drop table dbo.Table2;
go
create table dbo.Table1
(ColA int not null,ColB decimal(10,3) not null)
go
create table dbo.Table2
(ColA int primary key not null,ColB decimal(10,3) not null)
go
insert into dbo.Table1 values(1,5.0);
insert into dbo.Table1 values(1,6.0);
insert into dbo.Table2 values(1,7.0);
go
update dbo.Table2
set dbo.Table2.ColB=dbo.Table2.ColB+dbo.Table1.ColB
from dbo.Table2 inner join dbo.Table1
on(dbo.Table2.ColA=dbo.Table1.ColA)
select ColA as table2_colA,ColB as table2_colB from dbo.Table2
select ColA as table1_colA,ColB as table1_colB from dbo.Table1

update top(1) dbo.Table1 set ColB = ColB*2;

create table #temptable (col1 int);
insert into #temptable values(10);
select * from #temptable;
if OBJECT_ID(N'tempdb..#temptable',N'U') is not null
drop table #temptable;
go

truncate table #temptable;

if exists (select name from sys.indexes where name=N'IX_#temptable_col1')
drop index IX_#temptable_col1 on #temptable;
go
create index IX_#temptable_col1 on #temptable(col1);
go

alter table #temptable add col2 int;
if exists (select name from sys.indexes where name='IX_#temptable_col1_col2')
drop index IX_#temptable_col1_col2 on #temptable;
go
create index IX_#temptable_col1_col2 on #temptable(col1,col2);
go

drop index AK_#temptable_unicol1 on #temptable;
create unique index AK_#temptable_unicol1 on #temptable(col1);

alter index IX_#temptable_col1 on #temptable disable;

exec sp_rename N'#temptable.IX_#temptable_col1',N'IX_#temptable_col2',N'INDEX';

drop index IX_#temptable_col1 on #temptable.col1;