# window function
which countries have risen in the rankings based on the number of comments between Dec 2019 vs Jan 2020.
-- create table for Dec 2019 ranking 
-- create table for Jan 2020 ranking
-- left join Jan 2020 with Dec 2019 
-- add filter to indicate rising 

with dec_summary as (
select country, sum(no_comments) as no_comments_dec
,WINDOW
from fb_active_user b
left join fb_comments a 
on a.user_id = b.user_id
where created_at between '2019-12-01' and '2019-12-31'
group by country)

with jan_summary as (
select country, sum(no_comments) as no_comments_jan,
WINDOW
from fb_active_user b
left join fb_comments a 
on a.user_id = b.user_id
where created_at between '2020-01-01' and '2020-01-01'
group by country)

select * 
from jan_summary c
left join dec_summary d
on c.country = d.country
where c.jan_ranking > d.dec_ranking


note: rank() will skip the ranking numbers, e.g. 1,1,1,4,4,6; while dense_rank() will show 1,1,1,2,2,3,3,3,3,4
