
Table:Orders
| Column Name    |Type |
|order_number    | int |
|customer_number | int |

order_number is the primary key for this table.
This table contains information about the order ID and the customer ID.

Write an SQL query to find the customer_number for the customer who has placed the largest
number of orders.


The test cases are generated so that exactly one
customer will have placed more orders than any
other customer.

The query result format is in the following
example:

Table:Orders

-- | order_number | customer_number | 
-- |--------------|-----------------|
-- | 1            | 1               | 
-- | 2            | 2               | 
-- | 3            | 3               | 
-- | 4            | 3               |

-- Sample Output

-- | customer_number |
-- |-----------------|
-- | 3               |
-- Explanation

-- The customer with number '3' has two orders, 
-- which is greater than either customer '1' or '2' because each of them  only has one order. 
-- So the result is customer_number '3'.


-- Solution
-- Ranking them according to the number of orders to have same rank for 
-- customers with same number of orders

With t1 as 
(
  Select customer_number, 
  Rank() over(order by count(customer_number) desc) as rk
  from orders
  group by customer_number
) 

Select t1.customer_number
from t1
where t1.rk=1

-- alternate solution:

select
customer_number

from
(select customer_number, count(order_number) as cn
 from Orders
group by customer_number) a

order by
cn desc

limit 1;
