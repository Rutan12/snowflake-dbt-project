{% snapshot snap_products %}

{{
    config(
      target_schema='DBT_SNAPSHOTS',
      unique_key='product_id',
      strategy='check',
      check_cols=['product_name', 'category']
    )
}}

select
    product_id,
    product_name,
    category
from {{ ref('stg_products') }}

{% endsnapshot %}