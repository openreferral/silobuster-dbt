select
    'WithinReach' as contributor,
    id::varchar,
    organization_id::varchar,
    program_id::varchar,
    name,
    alternate_name,
    description,
    url,
    email,
    status,
    interpretation_services,
    application_process,
    fees,
    accreditations,
    licenses
from {{ source('silobuster_dbt', 'within_service') }}