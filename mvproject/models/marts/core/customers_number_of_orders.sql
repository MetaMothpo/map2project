with

customers as (
    select * from{{ref('stg_customers_check')}}
),
orders as(
    select * from {{ref('stg_orders')}}
),

customer_number_of_orders as(
    
    select
        customer_id,
        
        count(order_id) as num_of_orders
    from orders
    group by customer_id
    order by count(order_id) DESC

    
),

final as (
    select

        customers.first_name,
        customers.last_name,
        customer_number_of_orders.customer_id,
        coalesce(customer_number_of_orders.num_of_orders, 0)

    from customers
    left join customer_number_of_orders on customer_number_of_orders.customer_id = customers.customer_id
)
select * from final

