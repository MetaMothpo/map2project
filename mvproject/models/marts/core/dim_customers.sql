with customers as(
    select * from {{ref('stg_customers')}}
),



orders as (
    select * from {{ ref('fct_orders')}}
),


customers_orders as (
	select
		customer_id,
		min(order_date)as first_order_date,
		max(order_date)as recent_order_date,
		count(order_id) as number_of_orders,
		COUNT(*) FILTER (WHERE orders_status = 'completed') AS number_of_completed_orders,
		sum(payment_amount) as lifetime_value
		
	from orders
	group by 1
),

final as(
	select
		customers.customer_id,
		customers.first_name,
		customers.last_name,
		customers_orders.first_order_date,
		customers_orders.recent_order_date,
		coalesce(customers_orders.number_of_orders,0) as number_of_orders,
		coalesce(customers_orders.number_of_completed_orders, 0) as number_of_completed_orders
		
	from customers
	left join customers_orders on customers.customer_id = customers_orders.customer_id




	
		
)
select * from final