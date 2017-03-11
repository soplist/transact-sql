use points_management_DB;
select top 10 * from points_management_DB_points order by no desc;
select * from points_management_DB_event_category;
select * from points_management_DB_user;

select no,real_name from points_management_DB_user
where no not in
(select user_id from points_management_DB_points
where event_category=9 and convert(varchar(50),event_time,23) like '2017-03%' group by user_id);

select user_id from points_management_DB_points
where convert(varchar(50),event_time,23) like '2017-03%';

alter table points_management_DB_user add effective bit default 1;
update points_management_DB_user set effective=1;
update points_management_DB_user set effective=0 where username='zhengbin';
update points_management_DB_user set effective=0 where username='wangli';
update points_management_DB_user set effective=0 where username='chenxiaofang';
update points_management_DB_user set effective=0 where username='liuxueyong';
select * from points_management_DB_user where effective=0;