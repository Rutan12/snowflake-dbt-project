{% snapshot snap_customers %}

{{
    config(
      target_schema='DBT_SNAPSHOTS',
      unique_key='customer_id',
      strategy='check',
      check_cols=['customer_name', 'country']
    )
}}

select
    customer_id,
    customer_name,
    country
from {{ ref('stg_customers') }}

{% endsnapshot %}