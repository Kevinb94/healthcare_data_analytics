# 📊 Analysis Queries

This folder contains SQL queries that perform analytical deep dives on the normalized healthcare data generated by [Synthea](https://synthetichealth.github.io/synthea/).

All queries in this folder are designed to run against the **DuckDB** data warehouse, which has been pre-populated and normalized using **dbt models** found in the `/data_models` folder.

---

## 📁 Folder Purpose

The purpose of this folder is to:

- Provide **insightful analysis** of synthetic healthcare data
- Demonstrate **real-world use cases** like patient cohorts, treatment costs, utilization patterns, and more
- Serve as **executable `.sql` files** that can be run using DuckDB CLI or integrated into tools like Metabase

---

## 🧪 How to Run a Query

Make sure the `synthea.duckdb` database file is available and Docker services are running.

Then you can execute a query like:

```bash
./run_query.sh diabetes_costs.sql
```

> 📌 This uses the DuckDB CLI inside Docker to run your SQL against the shared database file.

---

## 📂 Query Index

| File Name               | Description                                      |
|-------------------------|--------------------------------------------------|
| `diabetes_costs.sql`    | Total healthcare costs for diabetic patients     |
| `condition_trends.sql`  | Condition frequency trends across age groups     |
| `medication_usage.sql`  | Most prescribed medications by condition         |
| `encounter_types.sql`   | Breakdown of inpatient vs outpatient visits      |
| `payer_summary.sql`     | Cost distribution by insurance provider          |

> Feel free to explore, modify, or contribute new analyses.

---

## 🛠 Dependencies

- Docker
- DuckDB CLI (inside container)
- Mounted `synthea.duckdb` database file

---

## 🧠 Related Folders

- `/data_models` – dbt models used to normalize raw Synthea data
- `/metabase_dashboards` – Optional Metabase visualizations
- `/duckdb_data_warehouse` – Dockerfile and config for DuckDB container

---

## 🤝 Contributions

If you add a new analysis query, please include a short description in the table above and follow the existing formatting conventions.
