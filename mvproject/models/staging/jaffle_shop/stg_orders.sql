with source as (
    select * from {{ db_orders_source('jaffle_shop', 'orders') }}
),

stagged as(


	select
		id as order_id,
		user_id as customer_id,
		order_date,
		status as orders_status
	from source
)
select * from stagged