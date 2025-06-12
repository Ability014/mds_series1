
  create or replace   view mds_prod.STAGING.stg_jaffle_items
  
   as (
    SELECT
	ID As ITEM_ID,
	SKU,
	ORDER_ID,
    _AIRBYTE_EXTRACTED_AT As LOADED_AT
FROM mds_prod.RAW.jaffle_items
  );

