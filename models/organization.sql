select
    id,
    source_id,
    assured_date,
    description,
    name,
    status,
    null as tax_id,
    url
from {{ ref('fin_wa_organization') }}

union all

select
    id,
    source_id,
    assured_date,
    description,
    name,
    status,
    tax_id,
    url
from {{ ref('fin_wr_organization') }} 

union all 

select
    id,
    source_id,
    null as assured_date,
    description,
    name,
    null as status,
    tax_id,
    url
from {{ ref('fin_what_organization') }} 

