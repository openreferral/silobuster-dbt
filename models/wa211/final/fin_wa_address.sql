-- Get the two address types into the same shape with field of "type".
with p as (
    select
        id as location_source_id,
        contributor,
        assured_date,
        address_1,
        address_2,
        city,
        region,
        state_province,
        postal_code,
        country,
        'physical' as type
    from {{ ref('stg_wa_site') }}
),

m as (
    select
        id as location_source_id,
        contributor,
        assured_date,
        postal_address_1 as address_1,
        postal_address_2 as address_2,
        postal_city as city,
        postal_region as region,
        postal_state_province as state_province,
        postal_postal_code as postal_code,
        postal_country as country,
        'mailing' as type
    from {{ ref('stg_wa_site') }}
),

-- Put 'em together!
a as (
    select * from p
    union all
    select * from m
),

-- Get actual location ID
l as (
    select
        id,
        source_id
    from {{ ref('location') }}
)

-- Put it all together.
select
    {{ dbt_utils.surrogate_key([
        'a.contributor',
        'a.location_source_id',
        'a.type'
    ]) }} as id,
    a.*,
    l.id as location_id
from a
join l on a.location_source_id = l.source_id