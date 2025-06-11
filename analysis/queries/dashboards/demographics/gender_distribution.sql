CREATE TABLE IF NOT EXISTS gender_distribution AS
SELECT gender, COUNT(*) AS patient_count FROM patients GROUP BY gender;