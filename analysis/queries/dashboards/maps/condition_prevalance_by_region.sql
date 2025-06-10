-- Prevalence of Hypertension (SNOMED code: 38341003) by ZIP
SELECT
  p.zip AS region_id,
  COUNT(DISTINCT p.id) AS total_patients,
  COUNT(DISTINCT CASE WHEN c.code = '38341003' THEN p.id END) AS hypertension_count,
  ROUND(COUNT(DISTINCT CASE WHEN c.code = '38341003' THEN p.id END) * 1.0 / COUNT(DISTINCT p.id), 4) AS hypertension_rate
FROM patients p
LEFT JOIN conditions c ON p.id = c.patient
GROUP BY p.zip
ORDER BY hypertension_rate DESC;
