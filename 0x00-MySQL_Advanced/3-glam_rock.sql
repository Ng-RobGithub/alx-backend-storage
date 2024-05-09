--This SQL query lists all bands with "Glam rock" as their main style, ranked by their longevity.
--It calculates the lifespan of each band by subtracting the year the band formed from the year the band split, or from the current year if the band is still active.
--The results are ordered in descending order based on the lifespan.

SELECT band_name, YEAR(CURDATE()) - formed AS lifespan
FROM metal_bands
WHERE main_style = 'Glam rock'
ORDER BY lifespan DESC;
