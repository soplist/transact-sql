select user_id,u.real_name,sum(case when point_value > 0 then point_value else 0 end) as  a,
sum(case when point_value < 0 then point_value else 0 end) as b,
sum(case when point_value > 0 then point_value else 0 end) + sum(case when point_value < 0 then point_value else 0 end) as c
from points_management_DB_points as p inner join points_management_DB_user as u on p.user_id=u.no 
group by user_id,u.real_name
order by user_id;