select
    id,
    organization_id,
    name,
    alternate_name,
    description,
    transportation,
    latitude,
    longitude,
    x_staff_notes,
    x_edit_notes
from {{ source('silobuster_dbt', 'within_location') }}