
  
    

create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_orders
    

    
    as (SELECT 
    ORDER_ID,
    CUSTOMER_ID,
    STORE_ID,
    CAST(SUBTOTAL As INTEGER) As SUBTOTAL,
    CAST(TAX_PAID As INTEGER) As TAX_PAID,
    CAST(ORDERED_AT As TIMESTAMP) As ORDERED_AT,
    CAST(ORDER_TOTAL As INTEGER) As ORDER_TOTAL,
    LOADED_AT,
FROM mds_prod.STAGING.stg_jaffle_orders
    )
;


  