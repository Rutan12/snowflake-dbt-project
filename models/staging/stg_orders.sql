select
    order_id,
    customer_id,
    product_id,
    order_date,
    amount,
    status
from (
    select
        *,
        row_number() over (
            partition by order_id
            order by order_date desc
        ) as rn
    from {{ source('raw', 'orders') }}
)
where rn = 1