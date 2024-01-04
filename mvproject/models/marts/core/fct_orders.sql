with orders as(
    select * from {{ref('stg_orders')}}
),

payments as (
	select * from{{ref('stg_payments')}}
),

order_payments as (
    select
        orderid,
        payment_status,
        payment_amount
    from payments
    
),

final as (

    SELECT
        orders.order_id,
        orders.customer_id,
        orders.orders_status,
        orders.order_date,
        payment_status,
        SUM(CASE WHEN payment_status = 'success' THEN payment_amount END) AS payment_amount
    FROM
        orders
    LEFT JOIN
        order_payments ON order_payments.orderid  =orders.order_id 
    GROUP BY
        orders.order_id,
        orders.customer_id,
        orders.orders_status,
        orders.order_date,
        payment_status
)
select * from final


