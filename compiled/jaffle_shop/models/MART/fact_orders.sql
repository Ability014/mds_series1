SELECT 
    md5(cast(coalesce(cast(orders.ORDER_ID as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(ITEM_ID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS ORDER_KEY,
    orders.ORDER_ID AS ORDER_ID,
    ITEM_ID,
    md5(cast(coalesce(cast(CUSTOMER_ID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS CUSTOMER_KEY,
    md5(cast(coalesce(cast(items.SKU as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS PRODUCT_KEY,
    md5(cast(coalesce(cast(STORE_ID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS STORE_KEY,
    SUBTOTAL,
    TAX_PAID,
    ORDERED_AT,
    ORDER_TOTAL,
    orders.LOADED_AT AS LOADED_AT
FROM mds_prod.INTERMEDIATE.int_jaffle_orders orders
LEFT JOIN mds_prod.INTERMEDIATE.int_jaffle_items items
ON orders.ORDER_ID = items.ORDER_ID