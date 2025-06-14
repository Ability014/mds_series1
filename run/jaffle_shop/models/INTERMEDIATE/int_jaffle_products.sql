
  
    

create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_products
    

    
    as (SELECT
	SKU,
	PRODUCT_NAME,
	PRODUCT_TYPE,
    CAST(UNIT_PRICE As INTEGER) as UNIT_PRICE,
    PRODUCT_DESCRIPTION,
    LOADED_AT
FROM mds_prod.STAGING.stg_jaffle_products
    )
;


  