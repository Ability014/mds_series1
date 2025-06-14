{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- set custom_schema = var('custom_schema', '') -%}
    {%- set selected_models = var('selected_models', '') -%}

    {%- if 'STAGING' in node.fqn -%}
        {% if 'INTERMEDIATE' in selected_models %}
            {%- set custom_schema = '' -%}
            {{ 'STAGING' ~ '' }}
        {% else %}
            {{ 'STAGING' ~ custom_schema }}
        {% endif %}
    {%- elif 'INTERMEDIATE' in node.fqn -%}
        {% if 'MART' in selected_models and 'INTERMEDIATE' in selected_models %}
            {{ 'INTERMEDIATE' ~ custom_schema }}
        {% elif 'MART' in selected_models %}
            {{ 'INTERMEDIATE' ~ '' }}
        {% else %}
            {{ 'INTERMEDIATE' ~ custom_schema }}
        {% endif %}
    {%- else -%}
        {{ 'MART' ~ custom_schema }}
    {%- endif -%}

{%- endmacro %}

