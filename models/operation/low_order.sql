SELECT *
FROM {{ source('rugs', 'rugs_usa_variant') }}
WHERE LOWER(status) = 'in_stock'
    AND low_stock = 'true'
