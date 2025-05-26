# Tuva Healthcare Claims Data Pipeline

This project uses [The Tuva Project](https://www.thetuvaproject.com/) to transform synthetic Medicare claims data into analytics-ready tables. It is built with a modern, reproducible development environment using:

- 🐍 **dbt** for data transformations
- 🦆 **DuckDB** as the local data warehouse
- 🐳 **Docker + DevContainers** for a consistent development setup
- 📁 **CMS CCLF Connector** to simulate real-world claims processing
- 📁 **Tuva Project** provides standardized dbt models for transforming healthcare data

---

## 🚀 Project Goals

- Practice healthcare data engineering using realistic claims file formats (CCLF)
- Transform messy raw claims data into structured, queryable models
- Use Tuva’s dbt models to simulate real pipelines used by healthcare analytics teams
- Visualize results (future enhancement) via tools like Metabase

---

## 🛠️ Tech Stack

| Tool          | Purpose                          |
|---------------|----------------------------------|
| dbt           | Data transformation framework    |
| DuckDB        | Embedded SQL analytics engine    |
| Tuva Project  | dbt models for healthcare data   |
| Docker        | Containerization                 |
| DevContainers | VS Code-based dev environment    |

---
