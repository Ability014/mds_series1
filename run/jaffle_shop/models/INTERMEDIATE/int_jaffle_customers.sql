
  
    

create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_customers
    

    
    as (SELECT 
    CUSTOMER_ID,
    CUSTOMER_NAME,
    LOADED_AT
FROM mds_prod.STAGING.stg_jaffle_customers
    )
;


  