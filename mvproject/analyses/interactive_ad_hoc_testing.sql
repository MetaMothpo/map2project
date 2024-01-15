 with 
 customers as (
    select * from{{ref('stg_customers_check')}}
)
 
 select
    customer_id
 from customers
 group by customer_id
 having count(*) > 1