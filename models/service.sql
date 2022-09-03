select
id,
    null as accreditations,
    organization_id,
    alternate_name,
    application_process,
    assured_date,
    contributor,
    description,
    document,
    email,
    emergency_information,
    fees,
    null as interpretation_services,
    null as licenses,
    name,
    null as status,
    url
from {{ ref('fin_wa_service') }}

union all

select
    id,
    organization_id,
    accreditations,
    alternate_name,
    application_process,
    null as assured_date,
    contributor,
    description,
    null as document,
    email,
    null as emergency_information,
    fees,
    interpretation_services,
    licenses,
    name,
    status,
    url
from {{ ref('fin_wr_service') }}