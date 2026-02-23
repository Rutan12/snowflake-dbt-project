select
  order_date,
  sum(amount) as total_revenue,
  count(order_id) as total_orders
from {{ ref('fact_orders') }}
group by order_date