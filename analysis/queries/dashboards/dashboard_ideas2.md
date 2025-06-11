# 📊 Metabase Dashboard & Chart Ideas for Synthea + DuckDB


---

## 🧑‍⚕️ Patient Demographics Dashboard

### Charts:
- **Bar Chart**: Count of patients by gender.
- **Pie Chart**: Distribution of races or ethnicities.
- **Bar/Line Chart**: Age distribution.
- **Map**: Patient count by ZIP code or state.

---

## 🏥 Encounters & Visits Dashboard

### Charts:
- **Time Series Line Chart**: Number of encounters over time (monthly/yearly).
- **Bar Chart**: Encounters by type (`wellness`, `emergency`, etc.).
- **Heatmap**: Encounters by day of week and hour.
- **Pivot Table**: Encounters grouped by patient and provider.

---

## 💊 Medications & Prescriptions Dashboard

### Charts:
- **Bar Chart**: Top prescribed medications.
- **Line Chart**: Prescription volume over time.
- **Pie Chart**: Medication classes (e.g., antibiotics, antihypertensives).

---

## 🧪 Conditions & Diagnoses Dashboard

### Charts:
- **Bar Chart**: Most common conditions (e.g., diabetes, hypertension).
- **Stacked Area Chart**: Trends in chronic diseases over time.
- **Donut Chart**: Grouped condition categories (using SNOMED/ICD codes if available).

---

## 📈 Outcomes & Progress Dashboard

### Charts:
- **Funnel Chart**: Diagnosis → Care Plan → Medication → Resolution.
- **Line Chart**: Track changes in metrics (e.g., weight or BMI over time).
- **Cohort Analysis**: Compare readmission or recurrence rates by group.

---

## 📋 Claims & Billing Dashboard

*(If using `claims.csv`)*

### Charts:
- **Bar Chart**: Claims by payer or procedure code.
- **Line Chart**: Claim costs over time.
- **Pie Chart**: Cost distribution across payers.
- **Histogram**: Cost per procedure or encounter.

---

## 🩻 Imaging & Procedures Dashboard

### Charts:
- **Bar Chart**: Imaging types frequency (X-ray, CT, MRI).
- **Time Series**: Imaging/procedure volume over time.
- **Stacked Bar Chart**: Procedures by provider.

---

## 🔒 Data Quality / Monitoring Dashboard

### Charts:
- **Bar Chart**: Missing value counts by column.
- **Line Chart**: Record count per table over time.
- **Table View**: Duplicate patients or invalid codes.

---

## 🛠 Metabase Features to Use

- **Dashboard Filters**: Gender, age, condition, provider, etc.
- **Custom Expressions**: Age buckets, cost bands, etc.
- **Interactive Dashboards**: Click-to-filter, time sliders, etc.

---
