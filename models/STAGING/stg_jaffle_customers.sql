SELECT 
    ID As CUSTOMER_ID,
    NAME As CUSTOMER_NAME,
    _AIRBYTE_EXTRACTED_AT as LOADED_AT
FROM {{ source('jaffle_shop', 'jaffle_customers') }}