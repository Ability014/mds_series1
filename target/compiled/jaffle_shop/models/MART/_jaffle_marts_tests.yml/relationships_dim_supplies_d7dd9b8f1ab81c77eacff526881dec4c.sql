
    
    

with child as (
    select product_key as from_field
    from mds_prod.MART.dim_supplies
    where product_key is not null
),

parent as (
    select product_key as to_field
    from mds_prod.MART.dim_products
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


