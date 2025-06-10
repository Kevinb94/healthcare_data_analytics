-- Count of prescriptions for a specific drug class (example: Lisinopril) by ZIP
SELECT
  p.zip AS region_id,
  d.description AS drug_name,
  COUNT(d.id) AS prescription_count
FROM patients p
JOIN medications d ON p.id = d.patient
WHERE LOWER(d.description) LIKE '%lisinopril%'
GROUP BY p.zip, d.description
ORDER BY prescription_count DESC;
