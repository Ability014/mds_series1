{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- set custom_schema = var('custom_schema', '') -%}
    {%- set selected_models = var('selected_models', '') -%}
    {%- set stg_schema = var('stg_schema', '') -%}
    {%- set int_schema = var('int_schema', '') -%}
    {%- set mart_schema = var('mart_schema', '') -%}
    {%- set current_node = node.fqn -%}

    {%- if 'STAGING' in node.fqn -%}
        {% if current_node[2] in selected_models %}
            {{ 'STAGING' ~ custom_schema }}
        {%- else -%}
            {{ stg_schema }}
        {% endif %}
    {%- endif -%}
    {%- if 'INTERMEDIATE' in node.fqn -%}
        {% if current_node[2] in selected_models %}
            {{ 'INTERMEDIATE' ~ custom_schema }}
        {%- else -%}
            {{ int_schema }}
        {% endif %}
    {%- endif -%}
    {%- if 'MART' in node.fqn -%}
        {% if current_node[2] in selected_models %}
            {{ 'MART' ~ custom_schema }}
        {%- else -%}
            {{ mart_schema }}
        {% endif %}
    {%- endif -%}

{%- endmacro %}

