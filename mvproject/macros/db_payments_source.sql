{% macro db_payments_source(source_name, table_name) %}

{% if target.name == 'dev' %}
    {{ source('stripe', 'stripe_payment') }}
{% elif target.name == 'prod' %}
    {{ source('dev_jaffle_shop', 'dev_customers') }}
{% endif %}

{% endmacro %}
