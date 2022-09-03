with o as (
    select
        id,
        source_id
    from {{ ref('fin_wr_organization') }}
)

select
    {{ dbt_utils.surrogate_key([
        's.contributor',
        's.id'
    ]) }} as id,
    s.id as source_id,
    o.id as organization_id,
    s.program_id,
    s.accreditations,
    s.alternate_name,
    s.application_process,
    s.contributor,
    s.description,
    s.email,
    s.fees,
    s.interpretation_services,
    s.licenses,
    s.name,
    s.status,
    s.url
from {{ ref('src_wr_service') }} s
join o on o.source_id = s.organization_id