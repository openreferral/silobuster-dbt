-- uncomment below to see output as a view
{{ config(materialized='view')}}

select
      {{dbt_utils.surrogate_key([
          'add.contributor'
        , 'add.id'
      ])}} as id
    , add.id as source_id 
    , loc.id as location_id
    , add.attention
    , add.address_1
    , add.address_2
    , add.city
    , add.region 
    , add.state_province
    , add.postal_code
    , add.country 

from {{ ref('stg_what_address')}} add
    left join {{ ref('fin_what_location') }} loc on add.location_id = loc.source_id

