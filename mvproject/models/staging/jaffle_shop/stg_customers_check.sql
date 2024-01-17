with source as (
    select * from {{ db_source('jaffle_shop', 'customers') }}
),

stagged as (
    select 
        customer_id,
        first_name,
        last_name
    from source
)

select * from stagged
