
  
    

        create or replace transient table mds_prod.INTERMEDIATE.int_jaffle_items
         as
        (SELECT 
    *
FROM mds_prod.STAGING.stg_jaffle_items
        );
      
  