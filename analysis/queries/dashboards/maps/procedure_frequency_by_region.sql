-- Procedure frequency by ZIP code
SELECT
  p.zip AS region_id,
  pr.code,
  pr.description,
  COUNT(*) AS procedure_count
FROM patients p
JOIN procedures pr ON p.id = pr.patient
GROUP BY p.zip, pr.code, pr.description
ORDER BY procedure_count DESC;
