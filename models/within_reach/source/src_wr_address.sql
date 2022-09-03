select
    'WithinReach' as contributor,
    id::varchar,
    location_id::varchar,
    attention,
    address_1,
    city,
    region,
    state_province,
    postal_code::varchar,
    country,
    'physical' as type
from {{ source('silobuster_dbt', 'within_physical_addresse') }}