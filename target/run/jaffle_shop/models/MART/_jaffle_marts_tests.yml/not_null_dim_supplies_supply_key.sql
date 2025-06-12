select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select supply_key
from mds_prod.MART.dim_supplies
where supply_key is null



      
    ) dbt_internal_test