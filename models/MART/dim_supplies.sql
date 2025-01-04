SELECT 
    {{ dbt_utils.generate_surrogate_key(['SUPPLIES_ID', 'SKU']) }} as UNIQUE_KEY,
    {{ dbt_utils.generate_surrogate_key(['SUPPLIES_ID']) }} as SUPPLY_KEY,
    {{ dbt_utils.generate_surrogate_key(['SKU']) }} as PRODUCT_KEY,
	COST,
    SUPPLIES_NAME,
    PERISHABLE,
    LOADED_AT
FROM {{ ref('int_jaffle_supplies') }}
