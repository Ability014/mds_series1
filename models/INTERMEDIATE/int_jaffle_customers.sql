SELECT 
    CUSTOMER_ID As CUSTOMER_ID,
    CUSTOMER_NAME,
    LOADED_AT
FROM {{ ref('stg_jaffle_customers') }}