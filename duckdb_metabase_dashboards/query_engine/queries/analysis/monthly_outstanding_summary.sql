CREATE VIEW monthly_outstanding_summary AS
SELECT
  date_trunc('month', SERVICEDATE) AS service_month,
  ROUND(SUM(OUTSTANDING1), 2) AS total_outstanding1,
  ROUND(SUM(OUTSTANDING2), 2) AS total_outstanding2,
  ROUND(SUM(OUTSTANDINGP), 2) AS total_outstanding_primary
FROM claims
WHERE SERVICEDATE IS NOT NULL
GROUP BY service_month
ORDER BY service_month;
