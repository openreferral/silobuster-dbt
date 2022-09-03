with s as (
    select
        organization_id,
        alternate_name,
        contributor,
        emergency_information,
        id,
        last_updated,
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
        last_updated,
        name
    from {{ ref('stg_wa_program') }}
)

select
    {{ dbt_utils.surrogate_key([
        's.contributor',
        's.id',
        'p.id'
    ]) }} as id,
    s.id as source_id,
    s.organization_id,
    s.alternate_name,
    s.emergency_information,
    s.short_description,
    s.email,
    s.url,
    p.application_process,
    p.description,
    p.document,
    p.name,
    p.fees
from s
join p on s.program_id = p.id