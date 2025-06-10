-- Readmission proxy: same patient has 2+ encounters within 30 days
WITH encounter_dates AS (
  SELECT p.id AS patient_id, p.zip, e.date
  FROM patients p
  JOIN encounters e ON p.id = e.patient
),
readmissions AS (
  SELECT
    a.zip AS region_id,
    a.patient_id,
    COUNT(*) AS readmission_events
  FROM encounter_dates a
  JOIN encounter_dates b
    ON a.patient_id = b.patient_id
   AND b.date > a.date
   AND b.date <= DATE_ADD('day', 30, a.date)
  GROUP BY a.zip, a.patient_id
)
SELECT
  region_id,
  COUNT(patient_id) AS patients_with_readmissions,
  COUNT(DISTINCT patient_id) AS unique_patients,
  ROUND(COUNT(patient_id) * 1.0 / COUNT(DISTINCT patient_id), 2) AS avg_readmissions_per_patient
FROM readmissions
GROUP BY region_id
ORDER BY avg_readmissions_per_patient DESC;
