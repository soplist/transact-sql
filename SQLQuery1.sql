select * from VM2015_his1501.dbo.tb_cmdinfo where command_id=208

select * from [VM2015_his1501].[dbo].[tb_cmdinfo] where [command_id]=179

use [transact-sql-test];
create table MyCustomerTable
(
user_login varbinary(85) default suser_sid(),
data_value varbinary(1)
);
go

insert MyCustomerTable(data_value) values(0x4F);
go

select * from MyCustomerTable

declare @MyCharVar char(25)

set @MyCharVar='Ricardo Adocicados'
set @MyCharVar='O''Leary'

print @MyCharVar

create view dbo.MyCustomerView as 
select data_value from MyCustomerTable

select * from MyCustomerView;

select CAST('01/01/2000 14:30' AS datetime)
select CAST('01/01/2000 04:30:20:500AM' AS datetime)
select CAST('01/01/2000 04:30:20:500 AM' AS datetime)

declare @dollars as money
set @dollars=$100
select @dollars

use [transact-sql-test]
create table TestMoney(cola int primary key,colb money)
go
insert into TestMoney values(2,$123123.45)
go
select * from TestMoney

select CONVERT(bit,'true'),CONVERT(bit,'false')

declare @TableVar Table(Cola int primary key,Colb char(30))
insert into @TableVar values(1,'beijing 2008')
insert into @TableVar values(2,'welcome to china')
select * from @TableVar
go

select * from VM2015_his1501.dbo.tb_cmdinfo where command_id=208

create table Contact(FirstName char(30),LastName char(30))
select LastName from Contact;
insert into Contact values('Achong','Gustavo');
select FirstName,LastName from Contact where FirstName like'A%';

select substring(FirstName,1,1),LastName from Contact;

select colb*100 from TestMoney;

select colb-colb/100 from TestMoney;

insert into TestMoney values(3,$123.45)

select MAX(colb)-MIN(colb) as test from TestMoney;

set nocount on
declare @startdate datetime,@adddays int
set @startdate='1/10/2000 12:00 AM'
set @adddays=30
set nocount off
select @startdate as 'Start Date',@startdate + @adddays as 'Add Date'

select * from TestMoney;
select cola,colb*2 as newcolb from TestMoney where cola<>2 order by cola asc;

create table bit_test_table
(
a_int_value int not null,
b_int_value int not null
);
go
insert bit_test_table values(170,75)
go
select a_int_value & a_int_value as reslult from bit_test_table

select ~a_int_value,~b_int_value from bit_test_table;
select a_int_value|b_int_value from bit_test_table;
select a_int_value^b_int_value from bit_test_table;

select ('beijing'+'2008');

--test annotation
/*annotation*/
create table TestDate(did int primary key,ddate date)
insert into TestDate values(1,'20160101')
select 'the date is '+CAST(ddate as varchar(128)) from TestDate;

if DB_ID(N'testlib') is not null
drop database testlib;
go
create database testlib;
select name,size,size*1.0/128 as [size in MBs] from sys.master_files where name=N'testlib'

if DB_ID(N'Saleslib') is not null
drop database Saleslib
go 
declare @data_path nvarchar(256)
set @data_path=(select SUBSTRING(physical_name,1,CHARINDEX(N'master.mdf',LOWER(physical_name))-1)
from master.sys.master_files
where database_id=1 and file_id=1);

execute('create database Saleslib
on
(NAME=Sales_dat,
filename='''+@data_path+'saledat.mdf'',
size=10,
maxsize=50,
filegrowth=5)
log on
(name=Sales_log,
filename='''+@data_path+'salelog.ldf'',
size=5MB,
maxsize=25MB,
filegrowth=5MB)'
);


declare @data_path nvarchar(256)
set @data_path=(select SUBSTRING(physical_name,1,CHARINDEX(N'master.mdf',LOWER(physical_name))-1)
from master.sys.master_files
where database_id=1 and file_id=1);

execute('alter database testlib
add file(
name=Test1dat2,
filename='''+@data_path+'t1dat2.ndf'',
size=5MB,
maxsize=100MB,
filegrowth=5MB
)'
);
go

declare @data_path nvarchar(256)
set @data_path=(select SUBSTRING(physical_name,1,CHARINDEX(N'master.mdf',LOWER(physical_name))-1)
from master.sys.master_files
where database_id=1 and file_id=1);

execute('alter database testlib
add log file
(
name=testlog2,
filename='''+@data_path+'test2log.ldf'',
size=5MB,
maxsize=100MB,
filegrowth=5MB
),
(
name=testlog3,
filename='''+@data_path+'test3log.ldf'',
size=5MB,
maxsize=100MB,
filegrowth=5MB
)'
);
go

dbcc shrinkfile(Data_File,7);

alter database testlib
set recovery simple;
go
dbcc shrinkfile(testlog3,1);
alter database testlib
set recovery full;

select FILE_ID,name from sys.database_files;
go
dbcc shrinkfile(1,truncateonly);

alter database testlib
add file(
name=Test1data,
filename='c:\t1data.ndf',
size=5MB
);
go
dbcc shrinkfile('Test1data',emptyfile);
go
alter database testlib
remove file Test1data;
go
