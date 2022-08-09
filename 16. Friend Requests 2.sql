Table: RequestAccepted
| Column Name |Type |
| requester id| int |
| accepter_id | int |
|accept_date  |date |

(requester_id, accepter_id) is the primary key for this table.
This table contains the ID of the user who sent the request, the
ID of the user who received the request, and the date when the
request was accepted.

Write an SQL query to find the people who have the
most friends and the most friends number.
The test cases are generated so that only one person
has the most friends.

Example: -- Table request_accepted

-- +--------------+-------------+------------+
-- | requester_id | accepter_id | accept_date|
-- |--------------|-------------|------------|
-- | 1            | 2           | 2016_06-03 |
-- | 1            | 3           | 2016-06-08 |
-- | 2            | 3           | 2016-06-08 |
-- | 3            | 4           | 2016-06-09 |
-- +--------------+-------------+------------+

-- Result table:
-- +------+------+
-- | id   | num  |
-- |------|------|
-- | 3    | 3    |
-- +------+------+
-- The person with id '3' is a friend of people '1', '2' and '4', so he has 3 friends in total, which is the most number than any others.

-- solution:
 select requester_id as id, b.total as num
from(
select requester_id, sum(one) as total
from((
select requester_id, count(distinct accepter_id) as one
from request_accepted
group by requester_id)
union all
(select accepter_id, count(distinct requester_id) as two
from request_accepted
group by accepter_id)) a
group by requester_id
order by total desc) b
limit 1

-- alternate solution:
select
a.requester_id as id,
(select count(1)
from RequestAccepted b
where
b.accepter_id = a.requester_id
or
b.requester_id = a.requester_id
) num
from
RequestAccepted a
order by
num desc
limit 1 
