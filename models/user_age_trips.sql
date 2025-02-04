with get_age as (
        select
            date(started_at)
        ,   extract(year from t.started_at) - extract(year from u.birth_date) as age
        from scooters_raw.trips as t
            join scooters_raw.users as u on t.user_id = u.id
    )
, count_trips as (
        select
            date
        ,   age
        ,   count(*) as trips
        from get_age
        group by 1,2
    )
select
    age
,   avg(trips)
from count_trips
group by 1
order by 1