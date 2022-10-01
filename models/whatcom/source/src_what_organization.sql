
-- uncomment below to see output as a view
-- {{ config(materialized='view')}}

select
    name
  , alternate_name
  , "x-status" as x_status
  , "x-verification" as x_verification
  , "Service Area" as service_area
  , phones
  , url 
  , description 
  , services 
  , email 
  , locations 
  , contacts
  , "x-website rating" as x_website_rating
  , "x-logo" as x_logo
  , legal_status
  , "x-status_last_modified" as x_status_last_modified

from {{ source('silobuster_dbt', 'what_organization')}}