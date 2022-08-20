-- see ques in OneNote

-- Solution
select a.product_id, a.year as first_year, a.quantity, a.price
from
( select product_id, quantity, price, year,
  rank() over(partition by product_id order by year) as rk
  from sales
) a
where a.rk = 1

-- alternate solution
select product_id, year as first_year, quantity, price
from Sales
where (product_id, year) in 
(select product_id, min(year) 
from sales
where (product_id, year)
in 
(select product_id, min(year)
from sales
group by product_id)
