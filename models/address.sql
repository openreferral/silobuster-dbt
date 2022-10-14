select
    id,
    location_id,
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

union all 

select 
    id,
    location_id,
    null as assured_date,
    attention, 
    address_1,
    address_2,
    city,
    region, 
    state_province, 
    postal_code,
    country,
    null as type
from {{ ref('fin_what_address') }} 

