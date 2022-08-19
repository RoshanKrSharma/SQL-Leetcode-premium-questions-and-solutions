-- See question in OneNote


-- Solution
select round(a.shortest,2) as shortest
from(
select sqrt(pow((p1.x-p2.x),2)+pow((p1.y-p2.y),2)) as shortest
from point_2d p1
cross join point_2d p2
where p1.x!=p2.x or p1.y!=p2.y
order by sqrt(pow((p1.x-p2.x),2)+pow((p1.y-p2.y),2))
limit 1) a

-- Alternate solution
Select
round(sqrt(min(pow(t1.x -t2.x , 2)
+pow(t1.y-t2.y,2))),2)
as shortest
from
Point 2D 1
join
Point2D 2
on
t1.x = t2.x or t1.y = t2.y

-- Or krna hoga yaha , AND krne se wrong answer aaega
