--- Product Metrics ---
with agg_data_by_products as (
select 
  product_key,
  product_type,
  product_name,
  min(unit_price) as unit_price,
  count(DISTINCT order_key) as order_volume,
  sum(order_total) as order_total,
  sum(profit) as product_profit
from jaffle_obt
where 1 = 1
{% if filter_values('product_type')|length %}
	and product_type in {{filter_values('product_type')|where_in}}
{% endif %}
{% if filter_values('product_name')|length %}
	and product_name in {{filter_values('product_name')|where_in}}
{% endif %}
{% if filter_values('store_name')|length %}
	and store_name in {{filter_values('store_name')|where_in}}
{% endif %}
{% if from_dttm is not none %}
	and CAST(ordered_at as date) >= cast('{{from_dttm}}' as DATE) 
	and CAST(ordered_at as date) < CAST('{{to_dttm}}' AS date)
{% endif %}
group by 1, 2, 3
)
select 
  *,
  min(unit_price) over() as overall_min_unit_price,
  max(unit_price) over() as overall_max_unit_price,
  max(order_volume) over() as overall_max_order_volume,
  max(order_total) over() as overall_max_order_value
from agg_data_by_products