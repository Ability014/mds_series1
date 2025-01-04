SELECT 
    {{ dbt_utils.generate_surrogate_key(['STORE_ID']) }} as STORE_KEY,
    STORE_NAME,
	TAX_RATE,
    OPENED_AT,
    LOADED_AT
FROM {{ ref('int_jaffle_stores') }}