-- Pull together numbers from multiple tables.
with s as (
    select
        contributor,
        null as location_source_id,
        id as service_source_id,
        phone_number,
        phone_extension,
        phone_description,
        'voice' as type,
        'servicesystem_phonemain' as source_key
    from {{ ref('stg_wa_service') }}
),

l as (
    select
        contributor,
        id as location_source_id,
        null as service_source_id,
        phone_number,
        phone_extension,
        phone_description,
        'voice' as type,
        'sitesystem_phonemain' as source_key
    from {{ ref('stg_wa_site') }}
),

p as (
    select * from s
    union all
    select * from l
),

-- Get the hashed foreign keys.
service as (
    select
        id,
        source_id
    from {{ ref('service') }}
),

location as (
    select
        id,
        source_id
    from {{ ref('location') }}
)

-- Put it all together.
select
    {{ dbt_utils.surrogate_key([
        'p.contributor',
        'p.location_source_id',
        'p.service_source_id',
        'p.source_key'
    ]) }} as id,
    p.contributor,
    p.location_source_id,
    p.service_source_id,
    p.phone_number,
    p.phone_extension,
    p.phone_description,
    p.type,
    service.id as service_id,
    location.id as location_id
from p
left join service on p.service_source_id = service.source_id
left join location on p.location_source_id = location.source_id