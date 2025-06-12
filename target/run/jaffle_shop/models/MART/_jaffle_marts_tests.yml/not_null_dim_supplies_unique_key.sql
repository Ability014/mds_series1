
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select unique_key
from mds_prod.MART.dim_supplies
where unique_key is null



  
  
      
    ) dbt_internal_test