{{
  config(
    materialized='view'
  )
}}

with orders as (
    select * from `dbt-tutorial.jaffle_shop.orders`
)
select * from orders