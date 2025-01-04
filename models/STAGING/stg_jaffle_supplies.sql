SELECT
	ID AS SUPPLIES_ID,
	SKU,
	COST,
    NAME As SUPPLIES_NAME,
    PERISHABLE,
    _AIRBYTE_EXTRACTED_AT As LOADED_AT
FROM {{ source('jaffle_shop', 'jaffle_supplies') }}
