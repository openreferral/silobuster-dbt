select
    'Washington 211' as contributor,
    agency_id as id,
    agencysystem_dateoflastcompleteupdate as assured_date,
    agencyoption_status as status,
    agencysystem_name as name,
    agencysystem_description as description,
    agencysystem_websiteurl as url,
    agencysystem_fein as tax_id
from {{ ref('src_wa_agency') }}