select
    {{ dbt_utils.surrogate_key([
        'contributor',
        'id'
    ]) }} as id,
    id as source_id,
    contributor,
    organization_id,
    last_updated,
    name
from {{ ref('stg_wa_site') }}