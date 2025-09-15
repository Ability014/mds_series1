
-- Business analysis
with first_cust_tx as (
select customer_key, min(ordered_at) as first_tx_date
from jaffle_obt 
group by 1
),
current_last_six as (
select CAST(date_trunc('month', ordered_at) AS DATE) date_key, customer_key, max(ordered_at) max_tx_date
from jaffle_obt
where 
1 = 1
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
{% else %}
	and ordered_at >= date_trunc('month', (dateadd('month', -5, current_date))) 
	and ordered_at < date_trunc('month', (dateadd('month', 1, current_date)))
{% endif %}
group by 1, 2
),
last_six_month_minus_one as (
select CAST(date_trunc('month', ordered_at) AS DATE) date_key, customer_key, max(ordered_at) max_tx_date
from jaffle_obt
where 
1 = 1
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
	and CAST(ordered_at as date) >= date_trunc('month', ( dateadd('month',-1,CAST('{{from_dttm}}' as date)))) 
	and CAST(ordered_at as date) < date_trunc('month', ( dateadd('month',-1,CAST('{{to_dttm}}' as date))))
{% else %}
	and ordered_at >= date_trunc('month', (dateadd('month', -6, current_date))) and ordered_at < date_trunc('month', current_date)
{% endif %}
group by 1, 2
)
select 
case when a.date_key is null and b.date_key is not null then cast(date_trunc('month', ( dateadd('month',1,b.date_key))) as DATE)
			when b.date_key is null and a.date_key is not null then a.date_key 
            else a.date_key end as date_key,
count(distinct a.customer_key) as active_users, 
count(case when a.customer_key is null and b.customer_key is not null then b.customer_key end) as churned_cust,
count(case when a.customer_key is not null and b.customer_key is not null then a.customer_key end) as retained_cust,
count(case when a.customer_key is not null and b.customer_key is null and a.max_tx_date<>c.first_tx_date then a.customer_key end) as returned_cust,
count(case when a.max_tx_date=c.first_tx_date then a.customer_key end) as new_cust,
cast(count(case when a.customer_key is null and b.customer_key is not null then b.customer_key end) as float)/decode(count(b.customer_key), 0, 1, count(b.customer_key)) *100 as churn_rate,
cast(count(case when a.customer_key is not null and b.customer_key is not null then a.customer_key end) as float)/decode(count(a.customer_key), 0, 1, count(a.customer_key))*100 as retention_rate
from current_last_six a 
full join last_six_month_minus_one b
on a.customer_key = b.customer_key and a.date_key = date_trunc('month', ( dateadd('month',1,b.date_key)))
left join first_cust_tx c
on a.customer_key = c.customer_key
group by 1
