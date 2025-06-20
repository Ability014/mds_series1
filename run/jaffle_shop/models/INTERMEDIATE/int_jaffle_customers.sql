
  
    

create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_customers
    

    
    as (SELECT 
    CUSTOMER_ID AS CUSTOMER_ID,
    CUSTOMER_NAME,
    'abc@gmail.com' AS EMAIL,
    'Ability' AS NICKNAME,
    LOADED_AT
FROM mds_prod.STAGING.stg_jaffle_customers
    )
;


  