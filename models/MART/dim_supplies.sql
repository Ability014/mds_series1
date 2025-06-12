SELECT 
    {{ dbt_utils.generate_surrogate_key(['SUPPLIES_ID', 'SKU']) }} As UNIQUE_KEY,
    {{ dbt_utils.generate_surrogate_key(['SUPPLIES_ID']) }} As SUPPLY_KEY,
    {{ dbt_utils.generate_surrogate_key(['SKU']) }} As PRODUCT_KEY,
	COST,
    SUPPLIES_NAME,
    PERISHABLE,
    LOADED_AT
FROM {{ ref('int_jaffle_supplies') }}
