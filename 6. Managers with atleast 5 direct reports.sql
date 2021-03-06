-- Question 75
-- id is the primary key column for this table. Each row of this table indicates the name of an employee, their department, and the id of there manager. If managerId is null then the employee doesn't have a manager.
-- No employee will be the manager of themselves
-- +------+----------+-----------+----------+
-- |Id    |Name 	  |Department |ManagerId |
-- +------+----------+-----------+----------+
-- |101   |John 	  |A 	      |null      |
-- |102   |Dan 	      |A 	      |101       |
-- |103   |James 	  |A 	      |101       |
-- |104   |Amy 	      |A 	      |101       |
-- |105   |Anne 	  |A 	      |101       |
-- |106   |Ron 	      |B 	      |101       |
-- +------+----------+-----------+----------+
-- Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:

-- +-------+
-- | Name  |
-- +-------+
-- | John  |
-- +-------+
-- Note:
-- No one would report to himself.

-- Solution
with t1 as
(
    select managerid, count(name) as total
    from employee
    group by managerid
)

select e.name
from t1
join employee e
on t1.managerid = e.id
where t1.total>=5

-- alternate solution
SELECT name
FROM Employee
WHERE id IN 
(SELECT ManagerId 
 FROM Employee 
 GROUP BY ManagerId
 HAVING COUNT(*)>=5)
