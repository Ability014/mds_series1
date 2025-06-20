
  
    

create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_supplies
    

    
    as (SELECT
	SUPPLIES_ID,
	SKU AS SKU,
	CAST(COST AS INTEGER) AS COST,
    SUPPLIES_NAME,
    CAST(PERISHABLE AS BOOLEAN) AS PERISHABLE,
    LOADED_AT
FROM mds_prod.STAGING.stg_jaffle_supplies
    )
;


  