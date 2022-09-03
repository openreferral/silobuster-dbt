select
    'WithinReach' as contributor,
    id,
    name,
    alternate_name,
    description,
    email,
    url,
    tax_status,
    tax_id,
    year_incorporated,
    legal_status,
    x_option_status as status,
    x_staff_notes,
    x_edit_notes,
    x_last_complete_update_at as assured_date
from {{ source('silobuster_dbt', 'within_organization') }}