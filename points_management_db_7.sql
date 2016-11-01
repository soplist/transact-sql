select * from points_management_DB_points;
select * from points_management_DB_user;
select CONVERT(CHAR(20),p.event_time,23),u.real_name,SUM(point_value) from points_management_DB_points as p inner join points_management_DB_user as u on p.user_id=u.no where DateDiff(dd,event_time,getdate())<=30 group by CONVERT(CHAR(20),p.event_time,23), u.real_name;