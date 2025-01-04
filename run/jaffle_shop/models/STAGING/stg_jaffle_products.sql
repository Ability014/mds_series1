
  create or replace   view mds_prod.STAGING.stg_jaffle_products
  
   as (
    SELECT
	SKU,
	NAME As PRODUCT_NAME,
	TYPE As PRODUCT_TYPE,
    PRICE As UNIT_PRICE,
    DESCRIPTION As PRODUCT_DESCRIPTION,
    _AIRBYTE_EXTRACTED_AT As LOADED_AT
FROM mds_prod.RAW.jaffle_products
  );

