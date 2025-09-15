--- Store Metrics ---
with agg_data_by_stores as (
select 
  store_key,
  store_name,
  max(opened_at) as opened_at,
  count(DISTINCT order_key) as order_volume,
  sum(unit_price) as revenue_before_tax,
  sum(order_total) as order_total,
  sum(profit) as store_profit
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
group by 1, 2
)
select 
  *,
  min(opened_at) over() as oldest_store,
  max(opened_at) over() as youngest_store,
  max(order_volume) over() as overall_max_order_volume,
  max(order_total) over() as overall_max_order_value
from agg_data_by_stores
