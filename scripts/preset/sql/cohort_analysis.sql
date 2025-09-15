-- Cohort Analysis
with first_active_tx as (
    select
        date_trunc('month', ordered_at) as date_key,
        customer_key,
        sum(order_total) as active_order_amount,
        min(date_trunc('month', ordered_at)) as cohort_date
    from jaffle_obt
    where
    1 = 1
    group by 1, 2
),
all_active_classes as (
    select
        date_trunc('month', ordered_at) as date_key,
        customer_key,
        sum(order_total) as active_order_amount
    from jaffle_obt
    where 1 = 1
    group by 1, 2
),
cohort as (
    select
        a.*,
        b.cohort_date,
        extract(year from a.date_key) as active_year,
        extract(month from a.date_key) as active_month,
        extract(year from b.cohort_date) as cohort_year,
        extract(month from b.cohort_date) as cohort_month,
        extract(year from a.date_key) - extract(year from b.cohort_date) as year_diff,
        extract(month from a.date_key) - extract(month from b.cohort_date) as month_diff,
        (extract(year from a.date_key) - extract(year from b.cohort_date)) * 12 + (extract(month from a.date_key) - extract(month from b.cohort_date)) as cohort_index
    from all_active_classes a 
    left join first_active_tx b
    on a.customer_key = b.customer_key and a.date_key >= b.cohort_date 
)
select *
from (
    select customer_key, cohort_date, cohort_index from cohort
) pivot (count(customer_key) for cohort_index in (0, 1, 2, 3, 4, 5, 6))
order by cohort_date