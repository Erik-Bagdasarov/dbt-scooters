select
    user_id,
    date(date_trunc('month', date)) as month,
    sum(price_rub) as revenue_total
from {{ ref('trips_users') }}
where
    1 = 1
    and not is_free
group by 1, 2
