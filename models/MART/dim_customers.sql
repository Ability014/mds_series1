SELECT 
    {{ dbt_utils.generate_surrogate_key(['CUSTOMER_ID']) }} as CUSTOMER_KEY,
    CUSTOMER_NAME,
    LOADED_AT
FROM {{ ref('int_jaffle_customers') }}