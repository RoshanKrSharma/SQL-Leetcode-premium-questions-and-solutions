-- Table: Candidate

-- | Column Name | Type   |
-- | id          | int    |
-- | name        | varchar|

-- id is the primary key column for this table.
-- Each row of this table contains information about the id and the name of a candidate.

-- Table: Vote
-- | Column Name | Type |
-- | id          | int  |
-- | candidateId | int  | 

-- id is an auto-increment primary key. candidateId is a foreign key to id from the Candidate table.
-- Each row of this table determines the candidate who got the ith vote in the elections.

-- example: 
-- Table: Candidate
-- +-----+---------+
-- | id  | Name    |
-- +-----+---------+
-- | 1   | A       |
-- | 2   | B       |
-- | 3   | C       |
-- | 4   | D       |
-- | 5   | E       |
-- +-----+---------+  
-- Table: Vote

-- +-----+--------------+
-- | id  | CandidateId  |
-- +-----+--------------+
-- | 1   |     2        |
-- | 2   |     4        |
-- | 3   |     3        |
-- | 4   |     2        |
-- | 5   |     5        |
-- +-----+--------------+

-- output:
-- +------+
-- | Name |
-- +------+
-- | B    |
-- +------+


-- Explanation:
-- Candidate 8 has 2 votes. Candidates C, D, and E have 1 vote each. The winner is candidate B.

-- Solution
with t1 as (
select *, rank() over(order by b.votes desc) as rk
from candidate c
join 
(select candidateid, count(*) as votes
from vote
group by candidateid) b
on c.id = b.candidateid)

select t1.name
from t1
where t1.rk=1

