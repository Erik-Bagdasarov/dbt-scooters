select
    "month",
    count(*) as "users",
    percentile_cont(0.5) within group (
        order by revenue_total
    ) as revenue_median,
    percentile_cont(0.95) within group (
        order by revenue_total
    ) as revenue_95,
    max(revenue_total) as max_revenue,
    sum(revenue_total) as sum_revenu
from {{ ref('revenue_user_monthly') }}
group by 1
