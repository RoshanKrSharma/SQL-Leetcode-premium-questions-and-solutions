Table: Insurance

| Column Name | Type  |
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+---------------------+
pid is the primary key column for this table.
Each row of this table contains information
about one policy where:
pid is the policyholder's policy ID.
Tiv_2015 is the total investment value in 2015
and tiv 2016 is the total investment value in
2016.
lat is the latitude of the policy holder's
city. 
lan is the longitude of the policy holder's
city.

Write an SQL query to report the sum of all total
investment values in 2016 tiv_2016,for all policyholders
who:
• have the same tiv_2015 value as one or more
other policyholders,and
• are not located in the same city like any other
policyholder(i.e.,the(lat, lon) attribute pairs
must be unique).

Round tiv_2016 to two decimal places.
example:
-- Sample Input
Table: Insurance

-- | PID | TIV_2015 | TIV_2016 | LAT | LON |
-- |-----|----------|----------|-----|-----|
-- | 1   | 10       | 5        | 10  | 10  |
-- | 2   | 20       | 20       | 20  | 20  |
-- | 3   | 10       | 30       | 20  | 20  |
-- | 4   | 10       | 40       | 40  | 40  |
-- Sample Output

-- | TIV_2016 |
-- |----------|
-- | 45.00    |
-- Explanation

-- The first record in the table, like the last record, meets both of the two criteria.
-- The TIV_2015 value '10' is as the same as the third and forth record, and its location unique.

-- The second record does not meet any of the two criteria. Its TIV_2015 is not like any other policyholders.

-- And its location is the same with the third record, which makes the third record fail, too.

-- Solution
select sum(TIV_2016) TIV_2016
from 
(select *, count(*) over (partition by TIV_2015) as c1, count(*) over (partition by LAT, LON) as c2
from insurance ) t
where c1 > 1 and c2 = 1; 

alernate solution: 
select round(
from Insurance
where TIV_2015 in (select TIV_2015 Insurance groupt by TIV_2015) and
concat lat,lon in
(select concat lat,lon) from Insurance
group by concat lat, lon)
having count(*) =1);
