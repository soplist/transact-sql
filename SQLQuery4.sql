use misdb;
if OBJECT_ID ('p15','P') is not null
drop procedure p15
go
create procedure p15
with execute as caller
as select * from t4;
go

exec p15;

alter procedure p15
as select col2 from t4;

drop procedure p15;

select * from t4;

create trigger tg1 on t4
instead of insert
as
insert into t4 values('wangkang1')

insert into t4 values('wangkang2')

create trigger tg2 on t4
after delete
as
insert into t4 values('wangkang3')

delete from t4 where col2='Wang Kang'

select * from t4;

create trigger tg3 on t4
for update
as
insert into t4 values('wangkang5')

update t4 set col2='wk1' where col2='wk'

use misdb
if object_id(N'tg4',N'TR') is not null
drop trigger tg4
go
create trigger tg4
on t4
after insert,update
as
insert into t4 values('kang')

insert into t4 values('wang')

select * from t4;

alter trigger tg4
on t4
after insert
as
insert into t4 values('wangk')

insert into t4 values('w5')

use misdb;
go
disable trigger tg4 on t4;
go

if OBJECT_ID('tg4','TR') is not null
drop trigger tg4;
go

set quoted_identifier off;
go
set nocount off;
go
use misdb;
go
create table t6
(
col1 int primary key,
col2 char(20) not null
);
go
set implicit_transactions on;
go
insert into t6 values(1,'aaa');
go
insert into t6 values(2,'bbb');
go
commit transaction
go
select COUNT(*) from t6;
go
insert into t6 values(3,'ccc');
go 
select * from t6;
go
commit transaction;
go
set implicit_transactions off;
go

use misdb;
go
select * from t4;

select * from t4 where col1>130 order by col1 asc;

select ROUND(col1*0.9999,2) as rate from t4;

select col2+CAST(col1 as varchar(10)) from t4;

select col1,col2,
case col2
when 'wk1' then ROUND(col1*0.9999,2)
when 'kang' then ROUND(col1*0.9999,4)
else ROUND(col1*0.9999,3)
end as col3
from t4

select col1,col2,
(select COUNT(*) from t4) as col3
from t4

select col1 as "col4" from t4;

select SUM(col1) as total from t4;

select COUNT(distinct col1) as 'after' from t4;

select DB_ID('misdb');

select a.col1 from t4 as a;

select * from t4 tablesample(10 percent);
select * from t4 tablesample(2 rows);

select * from t4 where col1 between 120 and 140;

select * from t4 where col1 in(120,125);

select * from t4 where col2 like 'w%';

select * from t4 where col1>all(select col1 from t4);

select * from t4 where col1>100 and col1<140;

select * from t4 where col1<120 or col1>140;

select col1 from t4 where col1>100 group by col1;

select sum(col1) from t4 group by col1 having SUM(col1)>120;

select DATEPART(MONTH,GETDATE());

declare @var1 datetime
set @var1 = '20160521'
select DATEPART(day,@var1);

select DATEADD(DAY,6,GETDATE());

select DATEDIFF(DAY,GETDATE(),'2009-07-01 00:00:00.000')

select FLOOR(256.45)

select ACOS(-.988),COS(1.256);

select ASIN(-.75),SIN(6);

select CEILING(12.9273);
select FLOOR(12.9273);
select POWER(2,3);
select EXP(198.1939);

select RAND();
select RAND(3);

select SUBSTRING(col2,1,2) from t4;

select CHARINDEX('w',col2) from t4;

select patindex('%wa%',col2) from t4;

select STR(0.123,4,1)

select STUFF('abc',2,3,'xyz');

select SOUNDEX('wang'),SOUNDEX('kang');

select DIFFERENCE('wang','kang');

select LTRIM('   wang');
select RTRIM('wang   ');

select LEFT(col2,2) from t4;
select RIGHT(col2,2) from t4;
select len(col2) as length from t4;