--This SQL script ranks the country origins of bands based on the number of fans.
SELECT origin, COUNT(fan_id) AS nb_fans
FROM bands
GROUP BY origin
ORDER BY nb_fans DESC;
