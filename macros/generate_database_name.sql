{% macro generate_database_name(custom_database_name, node) -%}


    {%- set default_database = target.database -%}
    {%- if custom_database_name is none -%}

        {{ default_database }}

    {%- elif target.name == 'ci' and execute -%}

        {% if 'STAGING' in node.fqn %}

            {{ 'mds_prod' }}

        {% else %}

            {{ 'mds_ci' }}

        {% endif %}

    {%- else -%}

        {{ custom_database_name }}

    {%- endif -%}

{%- endmacro %}