
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    order_key as unique_field,
    count(*) as n_records

from mds_prod.MART.fact_orders
where order_key is not null
group by order_key
having count(*) > 1



  
  
      
    ) dbt_internal_test