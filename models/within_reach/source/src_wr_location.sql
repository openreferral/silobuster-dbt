select
    'WithinReach' as contributor,
    id::varchar,
    organization_id::varchar,
    name,
    alternate_name,
    description,
    transportation,
    latitude,
    longitude,
    x_staff_notes,
    x_edit_notes
from {{ source('silobuster_dbt', 'within_location') }}