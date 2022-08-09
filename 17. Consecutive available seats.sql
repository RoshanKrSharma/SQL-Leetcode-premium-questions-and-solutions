Table:Cinema
| Column Name | Type |
| seat_id     | int  |
| free        | bool |

seat_id is an auto-increment primary key column
of this table.
Each row of this table indicates whether the ith
seat is free or not. 1 means free while 0 means
occupied.
Write an SQL query to report all the consecutive available
seats in the cinema.
Return the result table ordered by seat_id in ascending
order.
The test cases are generated so that more than two seats are
consecutively available.
example: 
-- | seat_id | free |
-- |---------|------|
-- | 1       | 1    |
-- | 2       | 0    |
-- | 3       | 1    |
-- | 4       | 1    |
-- | 5       | 1    |
 

-- Your query should return the following result for the sample case above.
 

-- | seat_id |
-- |---------|
-- | 3       |
-- | 4       |
-- | 5       |
-- Solution
Select seat_id
from(
select seat_id, free,
lead(free,1) over() as next,
lag(free,1) over() as prev
from cinema) a
where a.free=True and (next = True or prev=True)
order by seat_id

alternate solution:
select
distinct(a.seat_id)
from
Cinema a
inner join
Cinema b
on
abs(a.seat_id-b.seat_id) = 1   -- abs here is absolute funtion
where
a.free 1 and
b.free 1
order by seat_id
