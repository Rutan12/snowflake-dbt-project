select
  customer_id,
  customer_name,
  country
from {{ source('raw', 'customers') }}
