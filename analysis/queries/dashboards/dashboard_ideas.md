Dashboard 1: Population Demographics & Health Profile

Goal: Understand the composition and basic health characteristics of your simulated population.

    Chart 1: Age Distribution
        Type: Histogram or Bar Chart
        Data: patients.csv (patient_id, birthdate/age)
        Metric: Count of patients
        Breakdown: By age group (e.g., 0-17, 18-30, 31-50, 51-65, 65+).
        SQL Prep: SELECT FLOOR((JULIANDAY('now') - JULIANDAY(birthdate)) / 365.25) AS age_years, COUNT(*) FROM patients GROUP BY age_years; (You'd group into bins for the chart).
    Chart 2: Gender Distribution
        Type: Pie Chart or Bar Chart
        Data: patients.csv (gender)
        Metric: Percentage/Count of patients by gender.
        SQL Prep: SELECT gender, COUNT(*) FROM patients GROUP BY gender;
    Chart 3: Race & Ethnicity Distribution
        Type: Bar Chart
        Data: patients.csv (race, ethnicity)
        Metric: Count of patients by race and/or ethnicity.
        SQL Prep: SELECT race, COUNT(*) FROM patients GROUP BY race; (Similar for ethnicity).
    Chart 4: Top N Most Prevalent Conditions (by Prevalence Rate)
        Type: Bar Chart
        Data: conditions.csv (patient_id, code, description), patients.csv (patient_id)
        Metric: Count of unique patients with each condition, expressed as a percentage of total population.
        SQL Prep: SELECT c.DESCRIPTION, COUNT(DISTINCT c.PATIENT) AS patient_count, (COUNT(DISTINCT c.PATIENT) * 100.0 / (SELECT COUNT(*) FROM patients)) AS prevalence_rate FROM conditions c GROUP BY c.DESCRIPTION ORDER BY prevalence_rate DESC LIMIT 10;
    Chart 5: Patient Count by Geographic Area (if location data is granular)
        Type: Map (if Metabase's map functionality supports your location data) or Bar Chart
        Data: patients.csv (state, city, zip)
        Metric: Count of patients
        Breakdown: By State, City, or Zip Code.
        SQL Prep: SELECT STATE, COUNT(*) FROM patients GROUP BY STATE ORDER BY COUNT(*) DESC;

Dashboard 2: Healthcare Utilization & Access

Goal: Analyze how patients interact with the healthcare system.

    Chart 1: Encounters Over Time (Trend)
        Type: Line Chart
        Data: encounters.csv (start_date)
        Metric: Count of encounters
        Breakdown: By month or quarter.
        SQL Prep: SELECT STRFTIME('%Y-%m', START_DATE) AS month, COUNT(*) FROM encounters GROUP BY month ORDER BY month;
    Chart 2: Encounter Type Distribution
        Type: Pie Chart or Bar Chart
        Data: encounters.csv (code, description)
        Metric: Count of encounters by type (e.g., inpatient, outpatient, emergency).
        SQL Prep: SELECT DESCRIPTION, COUNT(*) FROM encounters GROUP BY DESCRIPTION;
    Chart 3: Top N Reasons for Encounters (Conditions at time of encounter)
        Type: Bar Chart
        Data: encounters.csv (encounter_id), conditions.csv (encounter_id, description - linking conditions to encounters)
        Metric: Count of encounters associated with each condition.
        SQL Prep: You'd need to join encounters to conditions on encounter_id (if available, otherwise link conditions by patient and date proximity) and count occurrences of condition descriptions.
    Chart 4: Average Length of Stay (Inpatient Encounters)
        Type: Bar Chart or Gauge
        Data: encounters.csv (start_date, end_date, description filtering for 'inpatient')
        Metric: Average difference in days between end_date and start_date.
        Breakdown: By encounter type (if you have sub-types), or just overall average.
        SQL Prep: SELECT AVG(JULIANDAY(END_DATE) - JULIANDAY(START_DATE)) FROM encounters WHERE DESCRIPTION LIKE '%inpatient%';
    Chart 5: Readmission Rate (within 30 days)
        Type: Gauge or Single Value/Progress Bar
        Data: encounters.csv (patient_id, start_date, description for 'inpatient', 'discharge')
        Metric: Percentage of inpatient discharges followed by another inpatient encounter within 30 days.
        SQL Prep: This requires a self-join on the encounters table to find subsequent admissions. Complex SQL, but doable in DuckDB.

Dashboard 3: Disease & Treatment Deep Dive

Goal: Focus on specific diseases, their management, and related observations.

    Chart 1: Patients by Condition and Age Group
        Type: Stacked Bar Chart
        Data: conditions.csv, patients.csv
        Metric: Count of patients
        Breakdown: X-axis: Condition, Y-axis: Count, Stacked by Age Group.
        SQL Prep: Join conditions and patients, calculate age groups, then group by condition description and age group.
    Chart 2: Top N Most Prescribed Medications
        Type: Bar Chart
        Data: medications.csv (description)
        Metric: Count of medication prescriptions.
        SQL Prep: SELECT DESCRIPTION, COUNT(*) FROM medications GROUP BY DESCRIPTION ORDER BY COUNT(*) DESC LIMIT 10;
    Chart 3: Medications Prescribed per Condition
        Type: Table or Grouped Bar Chart
        Data: medications.csv, conditions.csv (requires linking medications to active conditions at time of prescription, usually through patient_id and date ranges)
        Metric: Count of prescriptions for a specific condition.
        SQL Prep: This is tricky. You'd need a join where medications.PATIENT = conditions.PATIENT and medications.START_DATE falls within the conditions.START_DATE and conditions.STOP_DATE. Then group by condition and medication.
    Chart 4: Key Diagnostic Observation Trends (e.g., Blood Pressure, Glucose)
        Type: Line Chart or Scatter Plot
        Data: observations.csv (patient_id, code, description, value, date)
        Metric: Average value of a specific observation over time.
        Breakdown: By month/quarter for a specific observation (e.g., LOINC: 8480-6 for Systolic Blood Pressure).
        SQL Prep: SELECT STRFTIME('%Y-%m', DATE) AS month, AVG(VALUE) FROM observations WHERE DESCRIPTION = 'Systolic Blood Pressure' GROUP BY month ORDER BY month; (Filter for specific LOINC codes/descriptions)
    Chart 5: Immunization Coverage by Age Group
        Type: Stacked Bar Chart or Bar Chart (showing percentages)
        Data: immunizations.csv (patient_id, code, description), patients.csv
        Metric: Percentage of patients in an age group who have received a specific immunization.
        SQL Prep: Join immunizations and patients, group by age group, and calculate the proportion of vaccinated individuals for chosen vaccines.

Dashboard 4: Provider & Organizational Performance (if provider data is used)

Goal: Analyze the activity and patterns related to healthcare providers and organizations.

    Chart 1: Encounters by Organization
        Type: Bar Chart
        Data: encounters.csv (organization_id), organizations.csv (id, name)
        Metric: Count of encounters per organization.
        SQL Prep: SELECT o.NAME, COUNT(e.ID) FROM encounters e JOIN organizations o ON e.ORGANIZATION = o.ID GROUP BY o.NAME ORDER BY COUNT(e.ID) DESC;
    Chart 2: Top N Performing Providers (by encounter count)
        Type: Bar Chart
        Data: encounters.csv (provider_id), providers.csv (id, name)
        Metric: Count of encounters per provider.
        SQL Prep: SELECT p.NAME, COUNT(e.ID) FROM encounters e JOIN providers p ON e.PROVIDER = p.ID GROUP BY p.NAME ORDER BY COUNT(e.ID) DESC LIMIT 10;
    Chart 3: Conditions Managed by Top Providers
        Type: Table or Stacked Bar Chart
        Data: conditions.csv, encounters.csv, providers.csv
        Metric: Count of conditions associated with encounters from specific providers.
        SQL Prep: Join encounters to providers and conditions (linking conditions to encounters), then group by provider name and condition description.

Dashboard 5: Costs & Financials (if cost data is generated by Synthea)

Goal: Understand simulated healthcare expenditures.

    Chart 1: Total Cost Over Time
        Type: Line Chart
        Data: encounters.csv (total_claim_cost, start_date)
        Metric: Sum of total_claim_cost by month/quarter.
        SQL Prep: SELECT STRFTIME('%Y-%m', START_DATE) AS month, SUM(TOTAL_CLAIM_COST) FROM encounters GROUP BY month ORDER BY month;
    Chart 2: Average Cost per Encounter Type
        Type: Bar Chart
        Data: encounters.csv (description, total_claim_cost)
        Metric: Average total_claim_cost for each encounter type.
        SQL Prep: SELECT DESCRIPTION, AVG(TOTAL_CLAIM_COST) FROM encounters GROUP BY DESCRIPTION;
    Chart 3: Top N Costliest Conditions
        Type: Bar Chart
        Data: encounters.csv, conditions.csv (linking costs to primary conditions of encounters)
        Metric: Total cost associated with each condition.
        SQL Prep: Similar to linking meds to conditions, sum total_claim_cost for encounters related to specific conditions.