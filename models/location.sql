select
    id,
    source_id,
    null as alternate_name,
    assured_date,
    contributor,
    null as description,
    null as latitude,
    null as longitude,
    name,
    organization_id
from {{ ref('fin_wa_location') }}

union all

select
    id,
    source_id,
    alternate_name,
    null as assured_date,
    contributor,
    description,
    latitude,
    longitude,
    name,
    organization_id
from {{ ref('fin_wr_location') }}