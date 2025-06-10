-- Patient race distribution by ZIP code
SELECT
  p.zip AS region_id,
  p.race,
  COUNT(*) AS patient_count
FROM patients p
GROUP BY p.zip, p.race
ORDER BY p.zip, patient_count DESC;
