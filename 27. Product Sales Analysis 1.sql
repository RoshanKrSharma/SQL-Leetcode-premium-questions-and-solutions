--  see OneNote for question

-- Solution
Select a.product_name, b.year, b.price
from product as a
join
sales as b
on a.product_id = b.product_id
