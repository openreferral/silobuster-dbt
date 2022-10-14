
-- uncomment below to see output as a view
-- {{ config(materialized='view')}}

select
      'Whatcom' as contributor
    , id 
    , location_id -- do not want to use original id, need to make hash id of original id and contributor in location table
    , attention
    , address_1
    , x_address_2 as address_2
    , city
    , region 
    , state as state_province
    , postal_code::varchar
    , country 

from {{ ref('src_what_address')}}