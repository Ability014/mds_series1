SELECT 
    {{ dbt_utils.generate_surrogate_key(['CUSTOMER_ID']) }} As CUSTOMER_KEY,
    CUSTOMER_NAME,
    EMAIL,
    LOADED_AT
FROM {{ ref('int_jaffle_customers') }}