with 
source as (
	select * from {{source('jaffle_shop', 'customers')}}
),

stagged as(


	select
		id as order_id,
		user_id as customer_id,
		order_date,
		status as orders_status
	from jaffle_shop.orders
)
select * from stagged