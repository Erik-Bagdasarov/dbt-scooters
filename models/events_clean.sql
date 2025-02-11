select
    distinct user_id
,   "timestamp"
,   type_id
from {{ source('scooters_raw', 'events') }}
where 1=1
    and {% if is_incremental() %}
        "timestamp" > (select max("timestamp") from {{ this }})
    {% else %}
        "timestamp" < timestamp '2023-08-01'
    {% endif %}