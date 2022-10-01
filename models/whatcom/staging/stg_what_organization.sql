
-- uncomment below to see output as a view
-- {{ config(materialized='view')}}

select
    'Whatcom' as contributor
  , name
  , alternate_name
  , description 
  , email 
  , url
  , null as tax_status
  , null as tax_id
  , null as year_incorporated
  , legal_status

from {{ ref('src_what_organization')}}

