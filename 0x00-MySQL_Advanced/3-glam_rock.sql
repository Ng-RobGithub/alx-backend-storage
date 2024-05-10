-- Select bands with Glam rock as their main style and calculate lifespan
SELECT band_name, 
    (IF(split(lifespan, '–')[2] = 'present', 2022 - CAST(split(lifespan, '–')[1] AS UNSIGNED), 
    2022 - CAST(split(lifespan, '–')[2] AS UNSIGNED))) AS lifespan
FROM metal_bands
WHERE formed LIKE '%Glam rock%'
ORDER BY lifespan DESC;
