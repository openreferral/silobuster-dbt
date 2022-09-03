select
    {{ dbt_utils.surrogate_key([
        'contributor',
        'id'
    ]) }} as id,
    id as source_id,
    assured_date,
    contributor,
    description,
    name,
    status,
    tax_id,
    url
from {{ ref('src_wr_organization') }}