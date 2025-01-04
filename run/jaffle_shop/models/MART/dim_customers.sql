
  
    

        create or replace transient table mds_prod.MART.dim_customers
         as
        (SELECT 
    md5(cast(coalesce(cast(CUSTOMER_ID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as CUSTOMER_KEY,
    CUSTOMER_NAME,
    LOADED_AT
FROM mds_prod.INTERMEDIATE.int_jaffle_customers
        );
      
  