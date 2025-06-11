
    
    

select
    supply_key as unique_field,
    count(*) as n_records

from mds_prod.MART.dim_supplies
where supply_key is not null
group by supply_key
having count(*) > 1


