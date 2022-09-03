with o as (
    select
        id,
        source_id
    from {{ ref('organization') }}
    where contributor = 'Washington 211'
)

select
    {{ dbt_utils.surrogate_key([
        'l.contributor',
        'l.id'
    ]) }} as id,
    l.id as source_id,
    l.contributor,
    o.id as organization_id,
    l.assured_date,
    l.name
from {{ ref('stg_wa_site') }} l
join o on o.source_id = l.organization_id