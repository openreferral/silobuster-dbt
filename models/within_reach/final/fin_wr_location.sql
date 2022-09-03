with o as (
    select
        id,
        source_id
    from {{ ref('organization') }}
    where contributor = 'WithinReach'
)

select
    {{ dbt_utils.surrogate_key([
        'l.contributor',
        'l.id'
    ]) }} as id,
    l.id as source_id,
    o.id as organization_id,
    l.alternate_name,
    l.contributor,
    l.description,
    l.latitude,
    l.longitude,
    l.name
from {{ ref('src_wr_location') }} l
join o on o.source_id = l.organization_id