-- Get source data from service staging.
-- Extract location ids as list.
with stg_service as (
    select
        contributor,
        id as service_source_id,
        regexp_matches(service_at_location, '\d+') as location_id_list -- IDs happen to be integers
    from {{ ref('stg_wa_service') }}
),

-- Join the above table to itself, exploding location_id_list into rows.
-- This is our base table.
sal as (
    select
        contributor,
        service_source_id,
        location_source_id
    from stg_service
    cross join unnest(stg_service.location_id_list) as location_source_id
),

-- The next statements get hashed IDs from the core tables.
service as (
    select
        id as service_id,
        source_id as service_source_id
    from {{ ref('service') }}
),

location as (
    select
        id as location_id,
        source_id as location_source_id
    from {{ ref('location') }}
)

-- Stitch it all together.
select
    {{ dbt_utils.surrogate_key([
        'sal.contributor',
        'service.service_source_id',
        'location.location_source_id'
    ]) }} as id,
    sal.contributor,
    service.service_id,
    location.location_id,
    service.service_source_id,
    location.location_source_id
from sal
join service on sal.service_source_id = service.service_source_id
join location on sal.location_source_id = location.location_source_id