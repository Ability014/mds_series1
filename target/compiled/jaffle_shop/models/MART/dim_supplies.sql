SELECT 
    md5(cast(coalesce(cast(SUPPLIES_ID as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(SKU as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as UNIQUE_KEY,
    md5(cast(coalesce(cast(SUPPLIES_ID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as SUPPLY_KEY,
    md5(cast(coalesce(cast(SKU as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as PRODUCT_KEY,
	COST,
    SUPPLIES_NAME,
    PERISHABLE,
    LOADED_AT
FROM mds_prod.INTERMEDIATE.int_jaffle_supplies