with wa_o as (
    select
        id,
        source_id
    from {{ ref('organization') }}
    where contributor = 'Washington 211'
),

wa as (
    select
        {{ dbt_utils.surrogate_key([
            'wa.contributor',
            'wa.id'
        ]) }} as id,
        wa.id as source_id,
        wa.contributor,
        wa_o.id as organization_id,
        wa.last_updated,
        wa.name
    from {{ ref('stg_wa_site') }} wa
    join wa_o on wa_o.source_id = wa.organization_id
)

select * from wa