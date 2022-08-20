-- see question in OneNote

-- alternate solution

Select max(num) as num
from 
( 
    select num
    from my_numbers
    group by num
    having count(num)=1
) t1

-- yaha alias de k t1.num krte select mein to v wrong ni hota

