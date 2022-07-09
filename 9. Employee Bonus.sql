Table: Employee
-- | Column Name | Type   |
---+----------------------+- 
-- | empId       | int    |
-- | name        | varchar|
-- | salary      | int    |
-- |supervisor   | int    |
---+----------------------+-


-- empId is the primary key column for this table. Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.

Table: Bonus
-- | Column name | Type |
-- |  empId      | int  |
-- |  bonus      | int  |

-- empId is the primary key column for this table. empId is a foreign key to empId from the Employee table. Each row of this table contains the id of an employee and their respective bonus.

-- Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000. Return the result table in any order. The query result format is in the following

example:
-- Table:Employee

-- +-------+--------+-----------+--------+
-- | empId |  name  | supervisor| salary |
-- +-------+--------+-----------+--------+
-- |   1   | John   |  3        | 1000   |
-- |   2   | Dan    |  3        | 2000   |
-- |   3   | Brad   |  null     | 4000   |
-- |   4   | Thomas |  3        | 4000   |
-- +-------+--------+-----------+--------+

-- Table: Bonus

-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+

-- Example ouput:

-- +-------+-------+
-- | name  | bonus |
-- +-------+-------+
-- | John  | null  |
-- | Dan   | 500   |
-- | Brad  | null  |
-- +-------+-------+

-- Solution
Select E.name, B.bonus
From Employee E 
left outer join Bonus B -- left outer join krne se null values v include hua joining mein
on E.empId = B.empId
where B.bonus< 1000 or B.Bonus IS NULL
