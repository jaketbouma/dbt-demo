with orders as (
    select * from {{ ref('stg_orders') }}
)

with successful_payments as (
    select * from {{ ref('payments') }}
    where status = 'success'
)

orders_with_payments as (

    select
        order_id,
        customer_id,
        payments.amount as amount
    from orders
    left join payments using order_id
)

select * from orders_with_payments