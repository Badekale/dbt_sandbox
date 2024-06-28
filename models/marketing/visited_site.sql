WITH page AS (
    SELECT
        page_links,
        DATE(request_time_stamp) AS dt,
        COUNT(page_links) AS ct
    FROM {{ source('rugs', 'rugs_usa_links') }}
    GROUP BY DATE(request_time_stamp), page_links
)

SELECT
    page_links,
    dt AS request_date,
    ct AS count_item
FROM (
    SELECT
        *,
        RANK() OVER (PARTITION BY dt ORDER BY ct DESC) AS rk
    FROM page
) AS rk
WHERE rk <= 3
