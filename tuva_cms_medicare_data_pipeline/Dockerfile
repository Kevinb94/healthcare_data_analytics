FROM python:3.10-slim

RUN apt-get update && apt-get install -y git build-essential

# Install dbt + DuckDB adapter
RUN pip install dbt-core dbt-duckdb

# Create working directory
WORKDIR /app
