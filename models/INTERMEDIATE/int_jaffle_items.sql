SELECT 
    ITEM_ID,
	SKU,
	ORDER_ID AS ORDER_ID,
    LOADED_AT
FROM {{ ref('stg_jaffle_items') }}