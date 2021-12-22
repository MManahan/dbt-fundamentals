{{
  config(
    materialized='view'
  )
}}

with payment as (
    select 
        id as payment_id
         , orderid as order_id
         , paymentmethod as payment_method
         , status as payment_status
         , amount
         , created as created_at
         , _batched_at
    
    from `dbt-tutorial.stripe.payment`
)
select * from payment