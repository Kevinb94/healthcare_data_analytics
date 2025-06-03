install ducklake;
ATTACH 'ducklake:metadata.ducklake' AS synthea_ducklake;

ATTACH 'ducklake:synthea_ducklake.ducklake' AS synthea_ducklake (DATA_PATH '/app/data/csv/');
USE synthea_ducklake;

CREATE TABLE synthea_ducklake.demo (i INTEGER);
INSERT INTO synthea_ducklake.demo VALUES (42), (43);


FROM synthea_ducklake.demo;

CREATE TABLE ducklake_claims AS SELECT * FROM read_csv_auto('/app/data/csv/claims.csv');
