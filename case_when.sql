# case when - Every CASE statement must end with the END statement. The ELSE statement is optional
-- case one: categoring based on numerical values
with new_view as (select no_reviews, price,
      case when no_reviews = 0 then 'new'
           when no_reviews between 1 and 5 then 'rising'
           when no_reviews between 6 and 15 then 'trending up'
           when no_reviews > 15 then 'popular'
      end as host_popularity
      from airbnb_host_searches )

select host_popularity, min(price), max(price), avg(price)
from new_views
group by host_popularity

-- case two: categorizing based on text
select distinct inspection_name, 
case when business_name ILIKE '%restaurant%' then 'restaurant'
     when business_name ILIKE '%cafe%' then 'cafe'
     when business_name ILIKE '%kitchen%' then 'kitchen'
     else 'other'
 end as business_type
 
 
-- case three: quick & dirty one liners
1.count top 3 & click by users by case when ; 2. count all; 3.join two tables 
select 
 (count(case when position <=3 and has_clicked = 'yes' then b.search_id else null end) / count(*) :: FLOAT ) * 100 as percentage
 from fb_search_result a 
 left join fb_search_events b
 on a.result_id = b.search_id
 
-- case four: pivoting 
SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY 1
 
 pivoting 
 
 SELECT COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count
  FROM benn.college_football_players
  
  
# Facebook Question 
-- check for duplicate 
-- output ratio (active/all)
-- count with status = 'open'
-- count all
-- filter for US only 
-- case integer to float 

select * ,
count(case when status = 'open' then user_id else null end) / count(*) :: FLOAT as ratio 
from fb_active_users
where country = 'US'


