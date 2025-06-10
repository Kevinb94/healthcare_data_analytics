-- Number of encounters by ZIP code
SELECT
  p.zip AS region_id,
  COUNT(e.id) AS total_encounters
FROM patients p
JOIN encounters e ON p.id = e.patient
GROUP BY p.zip
ORDER BY total_encounters DESC;
