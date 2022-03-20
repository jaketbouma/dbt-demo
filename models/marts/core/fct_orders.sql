with orders as (
    select * from {{ ref('stg_orders') }}
),

successful_payments as (
    select * from {{ ref('stg_payments') }}
    where status = 'success'
),

orders_with_payments as (

    select
        order_id,
        customer_id,
        successful_payments.amount as amount
    from orders
    left join successful_payments using (order_id)
)

select * from orders_with_payments