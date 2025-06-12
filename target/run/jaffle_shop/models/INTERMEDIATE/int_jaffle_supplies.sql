
  
    

        create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_supplies
         as
        (SELECT
	SUPPLIES_ID,
	SKU,
	CAST(COST As INTEGER) As COST,
    SUPPLIES_NAME,
    CAST(PERISHABLE As BOOLEAN) As PERISHABLE,
    LOADED_AT
FROM mds_prod.STAGING.stg_jaffle_supplies
        );
      
  