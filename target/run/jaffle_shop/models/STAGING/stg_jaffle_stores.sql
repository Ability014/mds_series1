
  create or replace   view mds_prod.STAGING.stg_jaffle_stores
  
   as (
    SELECT
	ID As STORE_ID,
	NAME As STORE_NAME,
	TAX_RATE,
    OPENED_AT,
    _AIRBYTE_EXTRACTED_AT As LOADED_AT
FROM mds_prod.RAW.jaffle_stores
  );

