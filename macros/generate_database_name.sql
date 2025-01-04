{% macro generate_database_name(custom_database_name, node) -%}


    {%- set default_database = target.database -%}
    {%- if custom_database_name is none or target.name != 'dev' -%}

        {{ default_database }}

    {%- else -%}

        {{ custom_database_name }}

    {%- endif -%}

{%- endmacro %}