
    
    

select
    orders_key as unique_field,
    count(*) as n_records

from mds_prod.MART.fact_orders
where orders_key is not null
group by orders_key
having count(*) > 1


