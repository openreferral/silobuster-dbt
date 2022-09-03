select
    id,
    source_id,
    assured_date,
    contributor,
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
    contributor,
    description,
    name,
    status,
    tax_id,
    url
from {{ ref('fin_wr_organization') }}