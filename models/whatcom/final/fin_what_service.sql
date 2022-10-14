-- {{ config(materialized='view')}}

with s as (
    select 
        {{dbt_utils.surrogate_key([
        'organizations'
        ])}} as name_based_organization_id,
        contributor,
        organization_id,
        id,
        name,
        alternate_name,
        description,
        url,
        email,
        status,
        application_process,
        wait_time,
        fees,
        accreditations,
        licenses
    from {{ ref('stg_what_service') }}

),

    o as (
        select
            id, 
            source_id
        from {{ ref('fin_what_organization') }}
    )

select
    {{ dbt_utils.surrogate_key([
        's.contributor',
        's.id'
    ]) }} as id, 
    s.id as source_id, 
    o.id as organization_id,
    s.name,
    s.alternate_name,
    s.description,
    s.url,
    s.email,
    s.status,
    s.application_process,
    s.wait_time,
    s.fees,
    s.accreditations,
    s.licenses
from s 
join o on o.source_id = s.name_based_organization_id


