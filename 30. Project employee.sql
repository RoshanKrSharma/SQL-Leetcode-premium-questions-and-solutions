-- solution
Select a.project_id, round(sum(b.experience_years)/count(b.employee_id),2) as average_years
from project as a
join
employee as b
on a.employee_id=b.employee_id
group by a.project_id


-- alternate solution
select project_id,
round(sum(e.experience_years)/count(p.project_id),2) as average_years
from project_id p
left join e.employee_id 
on p.employee_id=e.employee_id
group by project_id
