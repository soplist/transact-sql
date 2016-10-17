create table points_management_DB_event_category
(
   no int identity(1,1) primary key,
   category_name nvarchar(20) not null
)
go

insert into points_management_DB_event_category(category_name) values('ÎÀÉú');