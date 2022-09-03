select
    {{ dbt_utils.surrogate_key([
        'contributor',
        'id'
    ]) }} as id,
    id as source_id,
    contributor,
    last_updated,
    status,
    name,
    description,
    url,
    tax_id
from {{ ref('stg_wa_agency') }}