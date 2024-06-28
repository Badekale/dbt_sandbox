{{ config(materialized='view') }}

SELECT
    category_value,
    SUM(count_item) AS count_item
FROM {{ ref("top_10_category") }}
GROUP BY category_value
ORDER BY SUM(count_item) DESC
LIMIT 10
