with customers as(
    select * from {{ref('stg_customers')}}
),



orders as (
    select * from {{ ref('fct_orders')}}
),

recent_order_dates as(
    select
        customer_id,
        order_date,
        order_id,
        orders_status,
        ROW_NUMBER() OVER (ORDER BY MAX(order_date) DESC) AS batch_id
    from orders 
    GROUP BY 1, 2, 3, 4

    {% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses > to include records whose timestamp occurred since the last run of this model)
    where order_date > (select max(order_date) from {{ this }})

{% endif %}
),

final as (
    select
        
        first_name,
        last_name,
        recent_order_dates.customer_id,
        recent_order_dates.order_date,
        recent_order_dates.orders_status,
        batch_id
        
    from recent_order_dates
    left join customers on recent_order_dates.customer_id = customers.customer_id
        
)

select * from final