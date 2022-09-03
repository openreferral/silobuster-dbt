select
    id,
    location_id,
    contributor,
    assured_date,
    null as attention,
    address_1,
    address_2,
    city,
    region,
    state_province,
    postal_code,
    country,
    type
from {{ ref('fin_wa_address') }}

union all

select
    id,
    location_id,
    contributor,
    null as assured_date,
    attention,
    address_1,
    null as address_2,
    city,
    region,
    state_province,
    postal_code,
    country,
    type
from {{ ref('fin_wr_address') }}