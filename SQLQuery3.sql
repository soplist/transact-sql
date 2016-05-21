use misdb;
create table t1 
(
col1 int,
col2 int,
col3 varchar(20),
col4 bit,
col5 datetime
);
select * from t1;
insert into t1 values(10,20,'text1',1,'2016-05-20');
insert into t1 values(20,20,'text1',2,'2016-05-20');

select * from t1 where col1*col2>=400;

create view v1 with schemabinding as select col1,col2,col1*(col2+10) as expcol from dbo.t1;
select * from v1;

select count_big(*) from dbo.t1;

use misdb;

create view v2 with schemabinding as select COUNT_BIG(*) as cnt from dbo.t1;

select * from v2; 

create view v3 as select col1 from dbo.t1;

select * from v3;

create proc p1 as select col2 from dbo.t1;

alter view v3 as select col2 from dbo.t1;

select * from dbo.t1;

alter table t1 add col6 int;

insert into t1 values(10,5,'text1',1,'2016-05-20',1);
insert into t1 values(5,20,'text1',1,'2016-05-20',2);

create table t2
(
col1 int,
col2 int,
);

insert into t2 values(50,1);
insert into t2 values(100,2);

alter view v3 as select a.col1,b.col2 from dbo.t1 a join dbo.t2 b on a.col6 = b.col2;
select * from v3;

if OBJECT_ID('v3') is not null
drop view v3;
go

create table t3(col1 int)
insert into dbo.t3 values(1)
insert into dbo.t3 values(2)
insert into dbo.t3 values(3)
go
select * from t3;

select @@VERSION 
set nocount on

use misdb;
go 
create view v4 as select col1 col2 from dbo.t2;
go
select * from dbo.v4;

begin transaction
go
use misdb;
go
create table dbo.t4
(
col1 int identity(100,5),
col2 nvarchar(100)
)
go
insert into t4(col2) values(N'A Bike Store');
insert into t4(col2) values(N'Progressive Sports');
insert into t4(col2) values(N'Modular Cycle Systems');
go
select col1,col2 from dbo.t4 order by col2 asc;
go
commit;
go

use misdb;
go
declare @MyVar int
select @MyVar =30;
go

declare @var1 nvarchar(30)
declare @var2 nchar(2)

declare @var3 varchar(20);
set @var3 = 'A Bike Store';
select * from t4 where col2=@var3;

use misdb;
go
create procedure p3 @var1 nvarchar(100) as
select col1,col2 from t4 where col2=@var1
go
exec p3 @var1 = 'A Bike Store'

use misdb;
go
create procedure p4 @var1 varchar,@var2 int output
as
declare @ErrorSave int
set @ErrorSave = 0
select * from t4 where col2=@var1
if(@ErrorSave<>0)
    set @ErrorSave = @@ERROR
return @ErrorSave
go

exec p4 @var1 = N'A Bike Store',@var2=2
select * from t4 where col2='A Bike Store';

if(@@ERROR<>0)
   declare @ErrorSaveVariable int
   set @ErrorSaveVariable = @@ERROR
   
if(@@ERROR<>0)
begin
   declare @ErrorSaveVariable int
   set @ErrorSaveVariable = @@ERROR
   PRINT 'Error encountered, '+CAST(@ErrorSaveVariable as varchar(10))
end

select * from t4;
use misdb;
go
begin transaction;
go
begin
update dbo.t4 set col2='Wang Kang'where col2='A Bike Store';
end 
go
commit work
begin
select * from t4;
end
go

select SYSTEM_USER
if(select SYSTEM_USER)='7EFC0359FFC44D9\akjr'
    goto g1
g1:

declare @Counter int;
set @Counter=1;
while @Counter<10
begin
    select @Counter
    set @Counter=@Counter+1
    if @Counter=4 goto g1
    if @Counter=5 goto g2
end
g1:
select 'jumping to g1.'
goto g3;
g2:
select 'jumping to g2'
g3:
select 'jumping to g3'

declare @ErrorSaveVariable int
begin transaction
if(@ErrorSaveVariable<>0)
begin
print 'errors encountered,rolling back.'
print 'last error encountered:'+cast(@ErrorSaveVariable as varchar(10))
rollback
end
else
begin
print 'no errors encountered,committing.'
commit
end

create procedure p5 @var1 sysname= null
as
if @var1 is null
begin 
print 'you must give a user name'
return
end

create procedure p6 @var1 sysname= null
as
if @var1 is null
begin 
print 'you must give a user name'
return
end
else
begin
select * from t4;
end;
exec p6 @var1='wang kang'

use misdb;
go
create procedure p8 @var1 varchar(11),@var2 int output
as
if(select COUNT(*) from t4)=3
    return 1
else
    return 2
    
declare @var2 int
declare @var3 int
exec @var3=p8 @var1='wangkang',@var2=1;
select @var3;

waitfor delay '00:00:10'
select * from t4;

use misdb;
go
declare abc cursor for
select * from t4;
open abc
fetch next from abc
while(@@FETCH_STATUS=0)
    fetch next from abc;
close abc;
deallocate abc;
go

create table dbo.t5
(
col1 int,
col2 nvarchar(100)
)
go
insert into t5 values(50,'w');
insert into t5 values(100,'k');

update dbo.t4 set dbo.t4.[col1]=100; 
go
use misdb;
go
while (select AVG(dbo.t5.col1) from dbo.t5)<500
begin
update dbo.t5 set t5.col1=t5.col1*2; 
if(select AVG(dbo.t5.col1) from dbo.t5)<600
    break
else
    continue
end

select * from t4;
select col2,case col2
    when 'Wang Kang' then 'wk'
    when 'Progressive Sports' then 'ps'
    when 'Modular Cycle Systems' then 'mcs'
    end as abbreviation
    from t4;
    
select col2,case col2
    when 'Wang Kang' then 'wk'
    when 'Progressive Sports' then 'ps'
    when 'Modular Cycle Systems' then 'mcs'
    end as abbreviation
    from t4
    order by col1;
    
begin try
select * from t4 where col2='Wang Kang';
end try
go
begin catch
select ERROR_NUMBER() as ErrorNumbar;
end catch
go

begin try
end try 

use misdb
go
if(select SUM(col1) from t4 where col2='Wang Kang' )>10
print N'there are large than 10.'


print N'the database engine instance '
+rtrim(@@servername)
+N' is running sql server build '
+rtrim(cast(ServerPROPERTY(N'productVersion ') as nvarchar(128)));
go

declare @Msg nvarchar(300);
select @Msg=N'the database engine instance '
+RTRIM(@@SERVERNAME)
+N' is running sql server build '
+rtrim(cast(ServerPROPERTY(N'productVersion ') as nvarchar(128)));
print @Msg

declare @ErrorVar int
raiserror(N'Message',16,1);
if @@ERROR<>0
print N'Error = '+cast(@@Error as nvarchar(8));
go

declare @ErrorVar int
raiserror(N'Message',16,1);
set @ErrorVar=@@ERROR
if @@ERROR<>0
print N'Error = '+cast(@@Error as nvarchar(8));
go

use misdb
go

create procedure dbo.p9
as select * from t4;
go
exec p9;
exec dbo.p9;
go
drop procedure p9;
go

use misdb
go
if OBJECT_ID('p9','P') is not null
drop procedure p9;
go
create procedure dbo.p9
as select * from t4;
go
exec dbo.p9;

create procedure p10
@var1 int output
as
return 1

create procedure p11
@var1 int output
as
select @var1=COUNT(*) from t4;

create procedure p12
@var1 int output
as
select @var1=COUNT(*) from t4;
return @var1

declare @var2 int;
exec @var2=p12 @var1=1;
select @var2


declare @var2 int;
exec @var2=p11 @var1=1;
select @var2



