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
    url
from {{ ref('stg_wa_agency') }}