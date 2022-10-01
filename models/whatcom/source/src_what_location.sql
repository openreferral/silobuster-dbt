
-- uncomment below to see output as a view
-- {{ config(materialized='view')}}

select 
    name
  , id
  , services 
  , service_id 
  , address 
  , organization 
  , organization_id 
  , alternate_name 
  , transportation 
  , latitude 
  , longitude 
  , description 
  , phones 
  , "x-details" as x_details
  , schedule

from {{ source('silobuster_dbt', 'what_location')}}