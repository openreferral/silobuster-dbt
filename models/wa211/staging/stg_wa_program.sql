select
    'Washington 211' as contributor,
    agency_id as organization_id,
    program_id as id,
    programsystem_lastupdatereviewdate as assured_date,
    programoption_status as status,
    programsystem_name as name,
    programsystem_description as description,
    programsystem_typeoffees as fees,
    programsystem_documentsrequired as document,
    programsystem_eligibility as eligibility_description,
    programsystem_applicationintakeprocess as application_process
from {{ ref('src_wa_program') }}