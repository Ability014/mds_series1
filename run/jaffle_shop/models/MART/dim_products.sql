
  
    

create or replace transient table mds_prod.MART.dim_products
    

    
    as (SELECT 
    md5(cast(coalesce(cast(SKU as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as PRODUCT_KEY,
    PRODUCT_NAME,
	PRODUCT_TYPE,
    UNIT_PRICE,
    PRODUCT_DESCRIPTION,
    LOADED_AT
FROM mds_prod.INTERMEDIATE.int_jaffle_products
    )
;


  