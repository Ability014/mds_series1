
  
    

create or replace transient table mds_prod.MART.dim_supplies
    

    
    as (SELECT 
    md5(cast(coalesce(cast(SUPPLIES_ID as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(SKU as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) As UNIQUE_KEY,
    md5(cast(coalesce(cast(SUPPLIES_ID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) As SUPPLY_KEY,
    md5(cast(coalesce(cast(SKU as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) As PRODUCT_KEY,
	COST,
    SUPPLIES_NAME,
    PERISHABLE,
    LOADED_AT
FROM mds_prod.INTERMEDIATE.int_jaffle_supplies
    )
;


  