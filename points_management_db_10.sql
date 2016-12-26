select u.real_name,sum(point_value) as a
from points_management_DB_points as p inner join points_management_DB_user as u on p.user_id=u.no 
group by u.real_name
order by a desc;