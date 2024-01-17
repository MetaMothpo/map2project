{% macro db_source(source_name, table_name) %}

{% if target.name == 'dev' %}
    {{ source('jaffle_shop', 'customers') }}
{% elif target.name == 'prod' %}
    {{ source('dev_jaffle_shop', 'dev_customers') }}
{% endif %}

{% endmacro %}
