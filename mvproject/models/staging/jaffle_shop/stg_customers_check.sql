with 
    source as(
        select *from{{source('jaffle_shop','customers')}}

    ),

    stagged as(
        select
            customer_id,
            first_name,
            last_name
        from jaffle_shop.customers
    )

select * from stagged