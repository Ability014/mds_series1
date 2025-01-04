
  create or replace   view mds_prod.STAGING.stg_jaffle_customers
  
   as (
    SELECT 
    ID As CUSTOMER_ID,
    NAME As CUSTOMER_NAME,
    _AIRBYTE_EXTRACTED_AT as LOADED_AT
FROM mds_prod.RAW.jaffle_customers
  );

