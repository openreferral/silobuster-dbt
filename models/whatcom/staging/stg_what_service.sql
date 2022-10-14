-- {{ config(materialized='view')}}
select
    'Whatcom' as contributor,
    id,
    organization_id,
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
    licenses, 
    organizations,
    phones

from {{ ref('src_what_service') }}