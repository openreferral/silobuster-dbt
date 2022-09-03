select
    agency_id,
    program_id,
    programcontact_programcontact,
    programsystem_lastupdatereviewdate,
    programoption_status,
    programsystem_name,
    programsystem_description,
    programsystem_typeoffees,
    programsystem_documentsrequired,
    programsystem_eligibility,
    programsystem_applicationintakeprocess
from {{ source('silobuster_dbt', 'wa211_program') }}