
  
    

        create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_stores
         as
        (SELECT
	STORE_ID,
	STORE_NAME,
	CAST(TAX_RATE As FLOAT) As TAX_RATE,
    CAST(OPENED_AT As TIMESTAMP) As OPENED_AT,
    LOADED_AT
FROM mds_prod.STAGING.stg_jaffle_stores
        );
      
  