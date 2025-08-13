{{
    config(
        materialized = 'view'
    )
}}

{{ dbt_date.get_date_dimension('2018-01-01', get_current_eoy()) }}