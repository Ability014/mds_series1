
  create or replace   view mds_prod.STAGING.stg_jaffle_orders
  
   as (
    SELECT
	ID As ORDER_ID,
    CUSTOMER As CUSTOMER_ID,
	STORE_ID,
	SUBTOTAL,
    TAX_PAID,
    ORDERED_AT,
    ORDER_TOTAL,
    _AIRBYTE_EXTRACTED_AT As LOADED_AT
FROM mds_prod.RAW.jaffle_orders
  );

