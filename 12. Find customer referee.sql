Table:Customer
| Column Name |  Type |
| id          |  int  |
| name        |varchar|
| referee_id  | int   |

id is the primary key column for this table.
Each row of this table indicates the id of a
customer, their name, and the id of the
customer who referred them.

Write an SQL query to report the IDs of the customer that
are not referred by the customer with id =2.
Return the result t in any order.

Example: 
Table: Customer
-- +------+------+-----------+
-- | id   | name | referee_id|
-- +------+------+-----------+
-- |    1 | Will |      NULL |
-- |    2 | Jane |      NULL |
-- |    3 | Alex |         2 |
-- |    4 | Bill |      NULL |
-- |    5 | Zack |         1 |
-- |    6 | Mark |         2 |
-- +------+------+-----------+

output: 
-- +------+
-- | name |
-- +------+
-- | Will |
-- | Jane |
-- | Bill |
-- | Zack |
-- +------+



solution: 
Select name
from customer 
where referee_id != 2
or referee_id is NULL

Learning from this question: is question m aisa names return krna tha jisme referee_id!=2 but output m wo sab v aaega jisme referee_id=null. So null check krne k liye alag se likhna padata h

