with l as (
    select
        id,
        source_id
    from {{ ref('fin_wr_location') }}
)

select
    {{ dbt_utils.surrogate_key([
        'a.contributor',
        'a.id'
    ]) }} as id,
    a.id as source_id,
    l.id as location_id,
    a.contributor,
    a.attention,
    a.address_1,
    a.city,
    a.region,
    a.state_province,
    a.postal_code,
    a.country,
    a.type
from {{ ref('src_wr_address') }} a
join l on l.source_id = a.location_id