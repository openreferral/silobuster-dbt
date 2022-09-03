-- Together same data from multiple tables.
with s as (
    select
        contributor,
        null as location_source_id,
        id as service_source_id,
        schedule_description,
        'servicesystem_hoursofoperation' as source_key
    from {{ ref('stg_wa_service') }}
),

l as (
    select
        contributor,
        id as location_source_id,
        null as service_source_id,
        schedule_description,
        'sitesystem_hoursofoperation' as source_key
    from {{ ref('stg_wa_site') }}
),

schedule as (
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
        'schedule.contributor',
        'schedule.location_source_id',
        'schedule.service_source_id',
        'schedule.source_key'
    ]) }} as id,
    schedule.contributor,
    schedule.location_source_id,
    schedule.service_source_id,
    schedule.schedule_description as description,
    service.id as service_id,
    location.id as location_id
from schedule
left join service on schedule.service_source_id = service.source_id
left join location on schedule.location_source_id = location.source_id