# 🧬 Synthea Data Generator

This folder contains a DevContainer-enabled setup for generating synthetic healthcare data using [Synthea](https://github.com/synthetichealth/synthea).

Synthea is an open-source synthetic patient generator that models realistic medical histories and health records — without containing any real patient data.

---

## 📁 Folder Purpose

The `synthea_data_generator` directory provides everything needed to:

- Build and run Synthea in a containerized development environment.
- Generate synthetic patient data (CSV, FHIR, etc).
- Share the output with other services like DuckDB or Metabase via mounted volumes.

---

## 🚀 How to Use

1. Open this folder in **VS Code with Dev Containers**.
2. Run the Synthea generator from the terminal:

```bash
./run_synthea.sh --export-csv
```

3. The output will appear in the shared `synthetic_healthcare_data/` directory, typically mounted as:

```
../synthetic_healthcare_data/synthea_output/
```

---

## 🔗 Integration

This folder is designed to work with the broader `healthcare_data_analytics` project, where other containers (e.g., DuckDB, Metabase) can read the generated data and build dashboards or pipelines.

---

## 📄 License

Synthea uses the MIT license. The generated data is 100% synthetic and safe for public or testing use.

---
