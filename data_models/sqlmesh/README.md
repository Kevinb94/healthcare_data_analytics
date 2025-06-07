# SQLMesh Data Models

This folder contains SQLMesh models used to define and manage transformations for the DuckDB data warehouse.

## Purpose

- Transform raw synthetic healthcare data into curated, analysis-ready datasets
- Organize logic for Metabase dashboards and data exploration
- Support reproducible and modular data pipelines using SQLMesh

## Structure

- `models/` — Core SQLMesh model definitions
- `audits/` — Optional tests and data validations
- `seeds/` — Static datasets used in transformations

## Requirements

- SQLMesh installed in your environment
- Access to the shared DuckDB database volume

---

> Used alongside Metabase and DuckDB for analytics on synthetic healthcare data
