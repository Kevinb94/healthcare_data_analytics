CREATE TABLE patient_age_groups AS
SELECT
    CASE
        WHEN age_years < 18 THEN '0-17'
        WHEN age_years BETWEEN 18 AND 30 THEN '18-30'
        WHEN age_years BETWEEN 31 AND 50 THEN '31-50'
        WHEN age_years BETWEEN 51 AND 65 THEN '51-65'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS patient_count
FROM (
    SELECT
        FLOOR(DATE_DIFF('day', birthdate, CURRENT_DATE) / 365.25) AS age_years
    FROM patients
) AS aged_patients
GROUP BY age_group
ORDER BY age_group;
