if exists(select * from sysobjects where name='points_management_DB_fixed_points')
   drop table points_management_DB_fixed_points
go

create table points_management_DB_fixed_points
(
   no int identity(1,1) primary key,
   user_id int not null,
   education int not null default 0,
   specialty int not null default 0,
   office int not null default 0,
   level int not null default 0,
   certificate int not null default 0,
)
go

alter table points_management_DB_fixed_points add constraint fk_fixed_points_user_id foreign key (user_id) references points_management_DB_user(no);

select * from points_management_DB_user;

insert into points_management_DB_fixed_points values(1,0,0,0,0,0);
insert into points_management_DB_fixed_points values(2,0,0,0,0,0);
insert into points_management_DB_fixed_points values(3,0,0,0,0,0);
insert into points_management_DB_fixed_points values(4,0,0,0,0,0);
insert into points_management_DB_fixed_points values(5,0,0,0,0,0);
insert into points_management_DB_fixed_points values(6,0,0,0,0,0);
insert into points_management_DB_fixed_points values(7,0,0,0,0,0);
insert into points_management_DB_fixed_points values(8,0,0,0,0,0);
insert into points_management_DB_fixed_points values(9,0,0,0,0,0);
insert into points_management_DB_fixed_points values(10,0,0,0,0,0);
insert into points_management_DB_fixed_points values(11,0,0,0,0,0);
insert into points_management_DB_fixed_points values(12,0,0,0,0,0);
insert into points_management_DB_fixed_points values(13,0,0,0,0,0);
insert into points_management_DB_fixed_points values(14,0,0,0,0,0);
insert into points_management_DB_fixed_points values(15,0,0,0,0,0);
insert into points_management_DB_fixed_points values(16,0,0,0,0,0);
insert into points_management_DB_fixed_points values(17,0,0,0,0,0);
insert into points_management_DB_fixed_points values(18,0,0,0,0,0);
