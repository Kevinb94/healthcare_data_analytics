SELECT race, COUNT(*) AS patient_count FROM patients GROUP BY race ORDER BY patient_count DESC;
-- Similar query for ethnicity