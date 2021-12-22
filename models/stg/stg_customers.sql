{{
  config(
    materialized='view'
  )
}}

with customers as (
    select * from `dbt-tutorial.jaffle_shop.customers`
)
select * from customers