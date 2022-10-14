select
    id,
    null as accreditations,
    organization_id,
    alternate_name,
    application_process,
    assured_date,
    description,
    document,
    email,
    emergency_information,
    fees,
    null as interpretation_services,
    null as licenses,
    name,
    null as status,
    url,
    source_id
from {{ ref('fin_wa_service') }}

union all

select
    id,
    accreditations,
    organization_id,
    alternate_name,
    application_process,
    null as assured_date,
    description,
    null as document,
    email,
    null as emergency_information,
    fees,
    interpretation_services,
    licenses,
    name,
    status,
    url,
    source_id
from {{ ref('fin_wr_service') }}

union all

select 
    id,
    accreditations,
    organization_id,
    alternate_name,
    application_process,
    null as assured_date,
    description,
    null as document,
    email,
    null as emergency_information,
    fees,
    null as interpretation_services,
    licenses,
    name,
    status,
    url,
    source_id

from {{ ref('fin_what_service') }}