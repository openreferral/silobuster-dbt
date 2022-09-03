with s as (
    select
        organization_id,
        alternate_name,
        contributor,
        emergency_information,
        id,
        assured_date,
        short_description,
        program_id,
        email,
        url
    from {{ ref('stg_wa_service') }}
),

p as (
    select
        id,
        application_process,
        description,
        document,
        fees,
        assured_date,
        name
    from {{ ref('stg_wa_program') }}
),

o as (
    select
        id,
        source_id
    from {{ ref('fin_wa_organization') }}
)

select
    {{ dbt_utils.surrogate_key([
        's.contributor',
        's.id',
        'p.id'
    ]) }} as id,
    s.id as source_id,
    o.id as organization_id,
    p.application_process,
    p.description,
    p.document,
    p.fees,
    p.name,
    s.alternate_name,
    s.assured_date, -- TODO: Should be more recent of program or service assured date.
    s.contributor,
    s.email,
    s.emergency_information,
    s.short_description,
    s.url
from s
join p on s.program_id = p.id
join o on o.source_id = s.organization_id