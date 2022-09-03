with wa as (
    select
        {{ dbt_utils.surrogate_key([
            'contributor',
            'id'
        ]) }} as id,
        cast(id as varchar) as source_id,
        assured_date,
        contributor,
        description,
        name,
        status,
        url
    from {{ ref('stg_wa_agency') }}
),

wr as (
    select
        {{ dbt_utils.surrogate_key([
            'contributor',
            'id'
        ]) }} as id,
        cast(id as varchar) as source_id,
        assured_date,
        contributor,
        description,
        name,
        status,
        url
    from {{ ref('src_wr_organization') }}
)

select * from wa
union all
select * from wr