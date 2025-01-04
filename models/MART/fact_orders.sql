
SELECT 
    {{ dbt_utils.generate_surrogate_key(['orders.ORDER_ID', 'ITEM_ID']) }} as ORDER_KEY,
    orders.ORDER_ID,
    ITEM_ID,
    {{ dbt_utils.generate_surrogate_key(['CUSTOMER_ID']) }} As CUSTOMER_KEY,
    {{ dbt_utils.generate_surrogate_key(['items.SKU']) }} as PRODUCT_KEY,
    {{ dbt_utils.generate_surrogate_key(['STORE_ID']) }} as STORE_KEY,
    SUBTOTAL,
    TAX_PAID,
    ORDERED_AT,
    ORDER_TOTAL,
    orders.LOADED_AT
FROM {{ ref('int_jaffle_orders') }} orders
LEFT JOIN {{ ref('int_jaffle_items') }} items
ON orders.ORDER_ID = items.ORDER_ID