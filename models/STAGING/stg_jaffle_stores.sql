SELECT
	ID As STORE_ID,
	NAME As STORE_NAME,
	TAX_RATE,
    OPENED_AT,
    _AIRBYTE_EXTRACTED_AT As LOADED_AT
FROM {{ source('jaffle_shop', 'jaffle_stores') }}