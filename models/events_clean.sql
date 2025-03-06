{% set date = var("date", none) %}

select distinct
    user_id,
    "timestamp",
    type_id,
    {{ updated_at() }},
    "date"
from {{ ref('events_prep') }}
where
    1 = 1
    and {% if is_incremental() %}
        {% if date %}
            date("timestamp") = date '{{ date }}'
        {% else %}
            "timestamp" > (select max(e."timestamp") from {{ this }} as e)
        {% endif %}
{% else %}
        "timestamp" < timestamp '2023-08-01'
{% endif %}
