## PURPOSE
-- used to group data
-- partition the set of tupkes into groups based on certain criteria
-- groups are formed on the basis of certain alt
-- agg. func. are calculated for each group 

## Basic Example
select country, city, count(*)
from customers 
where country like '%a%'
group by country, city
having count(*) > 1
order by count(*) ASC 
Note:
*where clause doesn't work with aggregate function; we must use having
*query clause order should be: where, group by, having, order by
*group by country, city; cannot group by country alone

## Facebook Example
select country, 
 count(CASE THEN carrier = 'a' THEN phone_number ELSE NULL END) as a, 
 count(CASE THEN carrier = 'B' THEN phone_number ELSE NULL END) as b, 
 count(CASE THEN carrier = 'C' THEN phone_number ELSE NULL END) as c
from fb_sms_sends
where ds = '08-07-2020'
group by country, carrier 
order by country ASC
