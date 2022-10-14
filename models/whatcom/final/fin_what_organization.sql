
-- uncomment below to see output as a view
-- {{ config(materialized='view')}}

select
  -- defining ID based on 'name' for now...may want to give the ID definition more thought
    {{dbt_utils.surrogate_key([
          'contributor'
        , 'name'
    ])}} as id
  , {{dbt_utils.surrogate_key(['name'])}} as source_id
  , name
  , alternate_name
  , description 
  , email 
  , url
  , null as tax_status
  , null as tax_id
  , null as year_incorporated
  , legal_status

from {{ ref('stg_what_organization')}}