select country, city, count(*)
from customers 
where country like '%a%'
group by country, city
having count(*) > 1
order by count(*) ASC 
Note: where clause doesn't work with aggregate function; we must use having
order should be: where, group by, having, order by
