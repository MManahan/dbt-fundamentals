WITH orders_agg AS (
    SELECT 
        order_id
         , sum(amount) as amount
    FROM 
        {{ ref('stg_payments') }}
    WHERE 
        payment_status = 'success'
    GROUP BY 1
),

orders AS (
    SELECT 
        order_id
         , customer_id
    FROM 
        {{ ref('stg_orders') }}

)
SELECT
    o.order_id
     , o.customer_id
     , oa.amount
FROM 
    orders as o 
LEFT JOIN
    orders_agg as oa
ON
    o.order_id = oa.order_id
