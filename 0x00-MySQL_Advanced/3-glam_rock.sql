-- Select bands with Glam rock as their main style and rank them by longevity
SELECT 
    band_name, 
    (SUBSTRING_INDEX(lifespan, '-', 1) + 2022) - SUBSTRING_INDEX(lifespan, '-', -1) AS lifespan
FROM 
    metal_bands
WHERE 
    main_style = 'Glam rock'
ORDER BY 
    lifespan DESC;
