SELECT
	ID As ITEM_ID,
	SKU,
	ORDER_ID,
    _AIRBYTE_EXTRACTED_AT As loaded_at
FROM {{ source('jaffle_shop', 'jaffle_items') }}