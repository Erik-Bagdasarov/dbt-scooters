select
    ec.user_id
,   ec.type_id
,   et."type"
,   ec."timestamp"
,   date(ec."timestamp") as "date"
,   ec.updated_at
from {{ ref('events_clean_v2') }} as ec
    left join {{ ref('event_types') }} as et using (type_id)