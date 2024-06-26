WITH color AS (
    SELECT
        color_value,
        DATE_PART('year', DATE(dw_insert_timestamp)) AS years,
        DATE_PART('month', DATE(dw_insert_timestamp)) AS months,
        COUNT(pid) AS ct
    FROM {{ source('rugs', 'rugs_usa_color_map') }}
    GROUP BY
        color_value, DATE_PART('year', DATE(dw_insert_timestamp)),
        DATE_PART('month', DATE(dw_insert_timestamp))
)

SELECT
    color_value,
    years,
    months,
    ct AS count_item
FROM (
    SELECT
        color_value,
        years,
        months,
        ct,
        RANK() OVER (PARTITION BY years, months ORDER BY ct DESC) AS rk
    FROM color
) AS rk
WHERE rk <= 10
