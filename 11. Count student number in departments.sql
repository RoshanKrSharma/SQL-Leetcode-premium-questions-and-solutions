Table:Student
  |Column Name   |Type  |
  |student_id   | int   |       
  |student_name |varchar|
  Igender       |varchar|
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
