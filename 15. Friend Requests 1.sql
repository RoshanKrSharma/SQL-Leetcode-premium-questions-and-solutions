Table: FriendRequest
| Column Name | Type |
| sender_id   | int  |
| send_to_id  | int  |
| request_date| date |

There is no primary key for this table, it may contain duplicates. This table contains the ID of the user who sent the request, the ID of the
user who received the request, and the date of the request. 

Table: RequestAccepted
| Column Name  |Type |
|Requester_id  | int |
| accepter_id  | int |
| accept_date  |date |

There is no primary key for this table,
it may contain duplicates.
This table contains the ID of the user
who sent the request, the ID of the
user who received the request, and the
date when the request was accepted.

Write an SQL query to find the overall acceptance
rate of requests,which is the number of
acceptance divided by the number of requests.
Return the answer rounded to 2 decimals places.

Note that:
• The accepted requests are not necessarily
from the table friend_request.In this
case,Count the total accepted requests(no
matter whether they are in the original
requests),and divide it by the number of
requests to get the acceptance rate.
• It is possible that a sender sends multiple
requests to the same receiver, and a
request could be accepted more than once.
In this case,the duplicated'requests or
acceptances are only counted once.
• If there are no requests at all,you should
return 0.00 as the accept_rate.

Example: 
input
-- Table: friend_request
-- | sender_id | send_to_id |request_date|
-- |-----------|------------|------------|
-- | 1         | 2          | 2016_06-01 |
-- | 1         | 3          | 2016_06-01 |
-- | 1         | 4          | 2016_06-01 |
-- | 2         | 3          | 2016_06-02 |
-- | 3         | 4          | 2016-06-09 |
 

-- Table: request_accepted
-- | requester_id | accepter_id |accept_date |
-- |--------------|-------------|------------|
-- | 1            | 2           | 2016_06-03 |
-- | 1            | 3           | 2016-06-08 |
-- | 2            | 3           | 2016-06-08 |
-- | 3            | 4           | 2016-06-09 |
-- | 3            | 4           | 2016-06-10 |

output
-- |accept_rate|
-- |-----------|
-- |       0.80|
 
-- solution:
-- lesson from this soltion: distinct jab likhnge and column values ko paranthesis m ni likhne then we'll get distinct values of all the column values jo v ',' deke select statement m likhe h

with t1 as
(
	select distinct sender_id, send_to_id   
	from friend_request
), t2 as
(
	select distinct requester_id, accepter_id
	from request_accepted
)
select 
ifnull((
        select distinct
        round((select count(*) from t2) / ( select count(*) from t1),2) from t1,t2
    ),0) as accept_rate


--alternate solution: 

select
round(ifnull((select count(*)from
(select RequestAccepted distinct requester_id, accepter_id
from ) as a)
/
(select count(*) from
(select distinct sender_id ,send_to_id
from FriendRequest) as b),0),2)
as accept_rate;
