-- Question 107
-- | Column Name | Type|
-- |num          | int |
-- |frequency    | int |


-- num is the primary key for this table.
-- Each row of this table shows the frequency of a number in the database.

-- The median is the value separating the higher half from the lower half of a data sample. 
-- Write an SQL query to report the median of all the numbers in the database after decompressing the Numbers table. Round the median to one decimal point.
-- The query result format is in the following example.
-- Example 1:
-- +----------+-------------+
-- |  Number  |  Frequency  |
-- +----------+-------------|
-- |  0       |  7          |
-- |  1       |  1          |
-- |  2       |  3          |
-- |  3       |  1          |
-- +----------+-------------+
-- In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.
-- output: 
-- +--------+
-- | median |
-- +--------|
-- | 0.0000 |
-- +--------+



-- Solution
with t1 as(
select *,
sum(frequency) over(order by number) as cum_sum, (sum(frequency) over())/2 as middle
from numbers)

select avg(number) as median
from t1
where middle between (cum_sum - frequency) and cum_sum

-- alternate solution
-- logic: 
-- first decompress the table
-- then sort the table
-- then apply median logic

select round (sum(num) /count (num),1) as median
from
(select num, frequency,
sum (frequency) over (order by num) as cum_num,
sum(frequency over() as tot_num
from Numbers 
) T1
where
tot_num/2 between cum_num frequency and cum_num

