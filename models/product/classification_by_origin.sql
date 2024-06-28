{{ config(materialized='view') }}

SELECT
    origin,
    category,
    STRING_AGG(DISTINCT "internalName", ', ') AS internalame,
    COUNT(DISTINCT "internalName") AS ct_internalame,
    COUNT(*) AS ct
FROM {{ source('rugs', 'rugs_usa_parent') }}
GROUP BY origin, category
ORDER BY origin, category
