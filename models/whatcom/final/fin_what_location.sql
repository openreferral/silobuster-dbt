-- uncomment below to see output as a view
-- {{ config(materialized='view')}}

select
      {{dbt_utils.surrogate_key([
          'loc.contributor'
        , 'loc.id'
      ])}} as id
      , loc.id as source_id
      , org.id as organization_id
      , loc.name 
      , loc.alternate_name
      , loc.description 
      , loc.transportation 
      , loc.latitude 
      , loc.longitude 

from {{ ref('stg_what_location')}} loc
    left join {{ ref('fin_what_organization') }} org on loc.organization_id = org.source_id