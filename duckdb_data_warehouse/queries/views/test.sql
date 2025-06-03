CREATE VIEW patient_claims AS
SELECT
    claims.id,
    claims.patientid,
    claims.providerid,
    claims.servicedate,
    claims.diagnosis1,
    patient.ssn,
    patient.first,
    patient.last
FROM
    claims
JOIN
    patients patient
ON
    claims.patientid = patient.id
