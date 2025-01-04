SELECT 
    {{ dbt_utils.generate_surrogate_key(['SKU']) }} as PRODUCT_KEY,
    PRODUCT_NAME,
	PRODUCT_TYPE,
    UNIT_PRICE,
    PRODUCT_DESCRIPTION,
    LOADED_AT
FROM {{ ref('int_jaffle_products') }}