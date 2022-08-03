Table:Student
  |Column Name   |Type  |
  |student_id   | int   |       
  |student_name |varchar|
  |gender       |varchar|
  |dept_id      |int    |
                              1
                     
  student_id is the primary key column for this
  table.
  dept_id is a foreign key to dept_id in the
  Department tables.
  Each row of this table indicates the name of a
  student,their gender,and the id of their
  department.
  
  Table:Department
  |Column Name|Type |
  |dept_id    | int
  |dept_name  |varchar|
  
  dept_id is the primary key column for this
  table.
  Each row of this table contains the id and the
  name ofadepartment.
Write an SQL query to report the respective department
name and number of students majoring in each
department for all departments in the Department table
(even ones with no current students).
Return the result table ordered by student number in
descending order.In case of a tie, order them by
dept_name alphabetically.
The query result format is in the following example.

example:
 student table:

-- | student_id | student_name | gender | dept_id |
-- |------------|--------------|--------|---------|
-- | 1          | Jack         | M      | 1       |
-- | 2          | Jane         | F      | 1       |
-- | 3          | Mark         | M      | 2       |
-- department table:

-- | dept_id | dept_name   |
-- |---------|-------------|
-- | 1       | Engineering |
-- | 2       | Science     |
-- | 3       | Law         |
-- The Output should be:

-- | dept_name   | student_number |
-- |-------------|----------------|
-- | Engineering | 2              |
-- | Science     | 1              |
-- | Law         | 0              |

-- Solution
select d.dept_name, count(s.dept_id) as student_number
from department d
left join student s
on d.dept_id = s.dept_id
group by d.dept_id
order by count(s.dept_id) desc, dept_name


alternate solution:

select d.dept_name, count(studen_id) as student_number
from student s
right join department d
on s.dept_id=d.dept_id
group by d.dept_name
order by student_number desc, dept_name asc
