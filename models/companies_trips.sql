with trips_cte as (
        select
            company
        ,   count(*) as trips
        from {{ ref('trips_prep') }} as t
            join {{ ref('scooters') }} as s on t.scooter_hw_id = s.hardware_id
        group by 1
    )
select
    t.company
,   t.trips
,   c.scooters
,   t.trips / cast(c.scooters as float) as trips_per_scooters
from trips_cte as t
    join {{ ref('companies') }} as c on t.company = c.company