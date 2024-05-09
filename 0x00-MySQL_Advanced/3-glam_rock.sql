-- This SQL script lists all bands with Glam rock as their main style, ranked by their longevity.

SELECT band_name, (YEAR('2022-01-01') - formed) AS lifespan
FROM bands
WHERE split LIKE '%Glam rock%'
ORDER BY lifespan DESC;
