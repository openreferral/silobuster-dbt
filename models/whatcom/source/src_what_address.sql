
-- uncomment below to see output as a view
-- {{ config(materialized='view')}}

-- grabbing all fields from source table
select 
      address_1
    , "x-address_2" as x_address_2
    , city
    , state
    , postal_code 
    , region 
    , country 
    , attention 
    , "x-type" as x_type
    , locations 
    , location_id 
    , services 
    , id 

from {{ source('silobuster_dbt','what_physical_addresse')}}