select
    t1.user_id
,   t1."timestamp"
,   t1.type_id
,   t2.type
from {{ ref("events_clean") }} as t1
    left join {{ ref('event_types') }} as t2 on t1.type_id = t2.type_id