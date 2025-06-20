SELECT 
    CUSTOMER_ID AS CUSTOMER_ID,
    CUSTOMER_NAME,
    'abc@gmail.com' AS EMAIL,
    'Ability' AS NICKNAME,
    LOADED_AT
FROM {{ ref('stg_jaffle_customers') }}