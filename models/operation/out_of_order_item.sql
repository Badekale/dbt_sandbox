SELECT *
FROM {{ source('rugs', 'rugs_usa_variant') }}
WHERE LOWER(status) = 'out_of_stock'
