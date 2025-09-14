with product_cost as (
  select product_key, sum(cost) as sku_cost 
  from {{ ref('dim_supplies') }} 
  group by 1
)
select 
  order_key,
  dc.customer_key,
  dp.product_key,
  ds.store_key,
  customer_name,
  store_name,
  product_name,
  product_type,
  opened_at,
  sku_cost as cost_price,
  unit_price,
  tax_rate*unit_price as tax_paid,
  tax_rate,
  unit_price+(tax_rate*unit_price) as order_total,
  unit_price-sku_cost as profit,
  ordered_at
from {{ ref('dim_customers') }} dc 
left join {{ ref('fact_orders') }} fo 
on dc.customer_key = fo.customer_key
full join {{ ref('dim_stores') }} ds
on ds.store_key = fo.store_key 
full join {{ ref('dim_products') }} dp 
on fo.product_key = dp.product_key
left join product_cost pc 
on dp.product_key = pc.product_key