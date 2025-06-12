
  create or replace   view mds_prod.STAGING.stg_jaffle_supplies
  
   as (
    SELECT
	ID AS SUPPLIES_ID,
	SKU,
	COST,
    NAME As SUPPLIES_NAME,
    PERISHABLE,
    _AIRBYTE_EXTRACTED_AT As LOADED_AT
FROM mds_prod.RAW.jaffle_supplies
  );

