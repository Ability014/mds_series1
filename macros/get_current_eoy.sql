{% macro get_current_eoy() -%}
  {{ run_started_at.replace(month=12, day=31).strftime('%Y-%m-%d') }}
{%- endmacro %}