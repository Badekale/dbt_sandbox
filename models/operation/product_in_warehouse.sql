SELECT
    product_type_id,
    name,
    brand,
    COUNT(*) AS ct
FROM {{ source('rugs', 'rugs_usa_parent') }}
GROUP BY product_type_id, name, brand
