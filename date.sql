with new_users as (
     select date_part('month', new_user_start_date) as month, 
            count(distinct user_id) as new_users 
     from (select user_id, 
                  min(time_id) as new_user_start_date
           from fact_events 
           group by user_id) sq
      group by month)
 
 with all_users as (
             select date_part('month', time_id) as month, 
             count(distinct user_id) as al_users
             from face_events
             group by month)
 
 select au.month, 
 new_users / all_users :: FLOAT as share_new_users, 
 1 - (new_users / all_users :: FLOAT) as share_existing_users 
 from all_users au
 join new_users nu on nu.month = au.month
