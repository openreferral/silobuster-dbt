select
    agency_id,
    agencycontact_agencycontact_both,
    agencysystem_dateoflastcompleteupdate,
    agencyoption_status,
    agencysystem_name,
    agencysystem_description,
    agencysystem_websiteurl,
    agencycustom_administratorname,
    agencycustom_administratortitle,
    agencysystem_licensesoraccreditations,
    agencysystem_fein,
    agencyoption_providertype
from {{ source('silobuster_dbt', 'wa211_agency') }}