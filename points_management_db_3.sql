select d.department_name as department,u1.username as username,p.event_time as event_time,p.point_value as point_value,c.category as event_category,p.fill_user as fill_user,u2.username as operate_user,p.operate_time as operate_time,p.update_time as update_time,p.event as event from points_management_DB_points as p inner join points_management_DB_user as u1 on p.user_id=u1.no inner join points_management_DB_user as u2 on p.operate_user=u2.no inner join points_management_DB_event_category as c on p.event_category=c.no inner join points_management_DB_department as d on u1.department_id=d.no

alter table points_management_DB_user add real_name nvarchar(20);

select * from points_management_DB_user;

update points_management_DB_user set real_name='Íõ¿µ' where no=1;
update points_management_DB_user set real_name='Ö£±ó' where no=2;

use points_management_DB
select d.department_name as department,u1.real_name as username,p.event_time as event_time,p.point_value as point_value,c.category as event_category,p.fill_user as fill_user,u2.real_name as operate_user,p.operate_time as operate_time,p.update_time as update_time,p.event as event from points_management_DB_points as p inner join points_management_DB_user as u1 on p.user_id=u1.no inner join points_management_DB_user as u2 on p.operate_user=u2.no inner join points_management_DB_event_category as c on p.event_category=c.no inner join points_management_DB_department as d on u1.department_id=d.no

select top 10 * from points_management_DB_points as p1 where p1.no not in(select top 100 p2.no from points_management_DB_points as p2);

select top 20 p2.no from points_management_DB_points as p2

select top 10 * from points_management_DB_points as p1 where p1.no not in(8);

select top 10 * from points_management_DB_points as p1 where p1.no not in(select top 10 p2.no from points_management_DB_points as p2);

select top 10 d.department_name as department,u1.real_name as username,p.event_time as event_time,p.point_value as point_value,c.category as event_category,p.fill_user as fill_user,u2.real_name as operate_user,p.operate_time as operate_time,p.update_time as update_time,p.event as event from points_management_DB_points as p inner join points_management_DB_user as u1 on p.user_id=u1.no inner join points_management_DB_user as u2 on p.operate_user=u2.no inner join points_management_DB_event_category as c on p.event_category=c.no inner join points_management_DB_department as d on u1.department_id=d.no where p.no not in(select top 10  p.no from points_management_DB_points as p inner join points_management_DB_user as u1 on p.user_id=u1.no inner join points_management_DB_user as u2 on p.operate_user=u2.no inner join points_management_DB_event_category as c on p.event_category=c.no inner join points_management_DB_department as d on u1.department_id=d.no)

insert into points_management_DB_user(username,passowrd,department_id,role,real_name) values('zhengbin','123456',2,0,'–c°²Òå');

select * from points_management_DB_user;

update points_management_DB_user set username='laanyi' where no=3;
