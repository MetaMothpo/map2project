-- tests\generictest\assert_num_of_orders_greater_than_five.sql

-- Example of a custom test
-- This is a dbt test file, e.g., test_customers_have_enough_orders.sql
SELECT
  *
FROM
  {{ ref('dim_customers') }} c
WHERE
  c.number_of_orders >10


