with 
source as (
select * from {{source('stripe', 'stripe_payment')}}
),


 stagged as
 (
    select
        id as payment_id,
        orderid,
        payment_method,
        payment_status,
        amount as payment_amount,
        payment_created_date
    from stripe.stripe_payment

)
select * from stagged