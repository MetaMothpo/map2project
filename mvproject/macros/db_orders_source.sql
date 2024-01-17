{% macro db_orders_source(source_name, table_name) %}

{% if target.name == 'dev' %}
    {{ source('jaffle_shop', 'orders') }}
{% elif target.name == 'prod' %}
    {{ source('dev_jaffle_shop', 'dev_orders') }}
{% endif %}

{% endmacro %}
