-- {{ config(materialized='view')}}
select 
    name, 
    organizations,
    organization_id, 
    alternate_name, 
    description, 
    locations, 
    location_id, 
    url, 
    email, 
    phones,
    contacts, 
    taxonomy, 
    taxonomy_term_id, 
    address, 
    id, 
    status, 
    application_process, 
    interpretation_services, 
    wait_time, 
    fees, 
    accreditations, 
    licenses, 
    schedule, 
    "x-details", 
    "y-org status", 
    programs

from {{ source('silobuster_dbt', 'what_service') }}




