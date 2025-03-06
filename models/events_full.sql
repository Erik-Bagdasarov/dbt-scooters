select
    e.user_id,
    e."timestamp",
    e.type_id,
    et."type",
    e.updated_at,
    e."date"
from {{ ref("events_clean") }} as e
left join {{ ref('event_types') }} as et on e.type_id = et.type_id
