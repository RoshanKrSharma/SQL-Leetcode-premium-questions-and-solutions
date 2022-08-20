-- See question in OneNOte
 -- solution and alternate solution are same

select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select COUNT(distinct product_key) from product)
 
