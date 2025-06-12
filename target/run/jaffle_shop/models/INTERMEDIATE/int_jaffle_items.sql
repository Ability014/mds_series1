
  
    

create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_items
    

    
    as (SELECT 
    ITEM_ID,
	SKU,
	ORDER_ID,
    LOADED_AT
FROM mds_prod.STAGING.stg_jaffle_items
    )
;


  