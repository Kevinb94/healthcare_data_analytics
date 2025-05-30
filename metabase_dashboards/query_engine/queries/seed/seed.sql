CREATE TABLE IF NOT EXISTS allergies AS
SELECT * FROM read_csv_auto('/app/data/csv/allergies.csv');

CREATE TABLE IF NOT EXISTS careplans AS
SELECT * FROM read_csv_auto('/app/data/csv/careplans.csv');

CREATE TABLE IF NOT EXISTS claims_transactions AS
SELECT * FROM read_csv_auto('/app/data/csv/claims_transactions.csv');

CREATE TABLE IF NOT EXISTS claims AS
SELECT * FROM read_csv_auto('/app/data/csv/claims.csv');

CREATE TABLE IF NOT EXISTS conditions AS
SELECT * FROM read_csv_auto('/app/data/csv/conditions.csv');

CREATE TABLE IF NOT EXISTS devices AS
SELECT * FROM read_csv_auto('/app/data/csv/devices.csv');

CREATE TABLE IF NOT EXISTS encounters AS
SELECT * FROM read_csv_auto('/app/data/csv/encounters.csv');

CREATE TABLE IF NOT EXISTS imaging_studies AS
SELECT * FROM read_csv_auto('/app/data/csv/imaging_studies.csv');

CREATE TABLE IF NOT EXISTS immunization AS
SELECT * FROM read_csv_auto('/app/data/csv/immunizations.csv');

CREATE TABLE IF NOT EXISTS medications AS
SELECT * FROM read_csv_auto('/app/data/csv/medications.csv');

CREATE TABLE IF NOT EXISTS observations AS
SELECT * FROM read_csv_auto('/app/data/csv/observations.csv');

CREATE TABLE IF NOT EXISTS organizations AS
SELECT * FROM read_csv_auto('/app/data/csv/organizations.csv');

CREATE TABLE IF NOT EXISTS patients AS
SELECT * FROM read_csv_auto('/app/data/csv/patients.csv');

CREATE TABLE IF NOT EXISTS payer_transitions AS
SELECT * FROM read_csv_auto('/app/data/csv/payer_transitions.csv');

CREATE TABLE IF NOT EXISTS payers AS
SELECT * FROM read_csv_auto('/app/data/csv/payers.csv');

CREATE TABLE IF NOT EXISTS procedures AS
SELECT * FROM read_csv_auto('/app/data/csv/procedures.csv');

CREATE TABLE IF NOT EXISTS providers AS
SELECT * FROM read_csv_auto('/app/data/csv/providers.csv');

CREATE TABLE IF NOT EXISTS supplies AS
SELECT * FROM read_csv_auto('/app/data/csv/supplies.csv');
