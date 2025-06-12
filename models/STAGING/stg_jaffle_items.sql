SELECT
	ID As ITEM_ID,
	SKU,
	ORDER_ID,
    _AIRBYTE_EXTRACTED_AT As LOADED_AT
FROM {{ source('jaffle_shop', 'jaffle_items') }}