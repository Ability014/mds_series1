
  
    

        create or replace transient table mds_prod.MART.dim_stores
         as
        (SELECT 
    md5(cast(coalesce(cast(STORE_ID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as STORE_KEY,
    STORE_NAME,
	TAX_RATE,
    OPENED_AT,
    LOADED_AT
FROM mds_prod.INTERMEDIATE.int_jaffle_stores
        );
      
  