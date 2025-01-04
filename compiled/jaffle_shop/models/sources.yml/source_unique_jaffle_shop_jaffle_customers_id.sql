
    
    

select
    id as unique_field,
    count(*) as n_records

from mds_prod.RAW.jaffle_customers
where id is not null
group by id
having count(*) > 1


