{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
  o.order_id,
  o.order_date,
  o.amount,
  c.customer_id,
  p.product_id,
  c.country,
  p.category
from {{ ref('stg_orders') }} o
left join {{ ref('dim_customers') }} c
  on o.customer_id = c.customer_id
left join {{ ref('dim_products') }} p
  on 1 = 1
