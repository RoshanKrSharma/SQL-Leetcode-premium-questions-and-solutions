-- see question in OneNote

-- Solution
select min(abs(abs(a.x)-abs(a.next_closest))) as shortest
from(
select *,
lead(x) over(order by x) as next_closest
from point) a 

-- alternate solution
select min(abs(p1.x-p2.x)) as shortest
from Point p1, Point p2
where p1.x!=p2.x
