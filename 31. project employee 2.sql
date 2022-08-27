-- Solution
select a.project_id
from(
select project_id,
rank() over(order by count(employee_id) desc) as rk
from project
group by project_id) a
where a.rk = 1


-- alternate solution

select p.project_id
from project p
group by p.project_id
having count(p.employee_id) =

(select max(T1.emp_count)
from
(select project_id, count(employee_id) as emp_count
from project
group by project_id) T1)
