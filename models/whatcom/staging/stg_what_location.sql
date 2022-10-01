-- uncomment below to see output as a view
-- {{ config(materialized='view')}}

with location_org_id as (
  select 
      id
    , replace(organization, '"', '') as org_name
  from {{ ref('src_what_location') }}
)

select   
    'Whatcom' as contributor
  , loc.id
  , {{ dbt_utils.surrogate_key(['loc_org.org_name']) }} as organization_id
  , name
  , alternate_name 
  , description 
  , transportation 
  , (case when latitude = '' then null else latitude end)::float as latitude
  , (case when longitude = '' then null else longitude end)::float as longitude

from {{ ref('src_what_location') }} loc
  join location_org_id loc_org on loc.id = loc_org.id