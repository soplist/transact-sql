select u.no,u.username,u.passowrd,u.department_id,u.role,d.department_name from points_management_DB_user as u inner join points_management_DB_department as d on u.department_id=d.no where username='wangkang' and passowrd='123456';

if exists(select * from sysobjects where name='points_management_DB_event_category')
   drop table points_management_DB_event_category
go
create table points_management_DB_event_category
(
   no int identity(1,1) primary key,
   category nvarchar(20) not null,
)
go

insert into points_management_DB_event_category(category) values('时间类别1');
insert into points_management_DB_event_category(category) values('时间类别2');
insert into points_management_DB_event_category(category) values('时间类别3');
insert into points_management_DB_event_category(category) values('时间类别4');


if exists(select * from sysobjects where name='points_management_DB_points')
   drop table points_management_DB_points
go

create table points_management_DB_points
(
   no int identity(1,1) primary key,
   user_id int not null,
   event_time datetime,
   point_value int not null,
   event_category int not null,
   fill_user nvarchar(20) not null,
   operate_user int not null,
   operate_time datetime,
   update_time datetime,
   event nvarchar(200) not null
)
go

alter table points_management_DB_points add constraint fk_user_id foreign key (user_id) references points_management_DB_user(no);
alter table points_management_DB_points add constraint fk_operate_user foreign key (operate_user) references points_management_DB_user(no);
alter table points_management_DB_points add constraint fk_event_category foreign key (event_category) references points_management_DB_event_category(no);

insert into points_management_DB_points(user_id,event_time,point_value,event_category,fill_user,operate_user,operate_time,update_time,event) values(1,'2016-10-09','30',1,'王康',1,'2016-10-10','','卖出去了20根香蕉');

select d.department_name,p.no,p.user_id,p.event_time,p.point_value,p.event_category,p.fill_user,p.operate_user,p.operate_time,p.update_time,p.event,u1.department_id,u1.username,u2.username,c.category from points_management_DB_points as p inner join points_management_DB_user as u1 on p.user_id=u1.no inner join points_management_DB_user as u2 on p.operate_user=u2.no inner join points_management_DB_event_category as c on p.event_category=c.no inner join points_management_DB_department as d on u1.department_id=d.no;
