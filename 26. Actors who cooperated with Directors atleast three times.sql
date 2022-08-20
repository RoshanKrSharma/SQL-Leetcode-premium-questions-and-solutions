-- question in OneNote
-- Solution 
Select actor_id, director_id
from actordirector
group by actor_id, director_id
having count(*)>=3

-- alternate solution

Select actor_id, director_id
from actordirector
group by actor_id, director_id
having count(timestamp)>=3
