select
    num_of_orders

from {{ref('customers_number_of_orders')}}
where num_of_orders > 1