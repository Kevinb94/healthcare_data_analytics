SELECT
    c.DESCRIPTION,
    COUNT(DISTINCT c.PATIENT) AS unique_patient_count,
    (COUNT(DISTINCT c.PATIENT) * 100.0 / (SELECT COUNT(*) FROM patients)) AS prevalence_rate_percent
FROM conditions c
GROUP BY c.DESCRIPTION
ORDER BY prevalence_rate_percent DESC
LIMIT 10;