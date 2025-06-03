FROM python:3.11-slim

ENV DUCKDB_VERSION="v1.3.0"

# Optional: install system tools like curl, nano
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl unzip nano && \
    rm -rf /var/lib/apt/lists/*

    # Install DuckDB CLI manually
# RUN curl -L -o duckdb.zip https://github.com/duckdb/duckdb/releases/download/v0.10.2/duckdb_cli-linux-amd64.zip && \
#     unzip duckdb.zip -d /usr/local/bin && \
#     rm duckdb.zip


RUN curl -L -o duckdb.zip https://github.com/duckdb/duckdb/releases/download/${DUCKDB_VERSION}/duckdb_cli-linux-amd64.zip && \
    unzip duckdb.zip -d /usr/local/bin && \
    rm duckdb.zip

# Copy and install Python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /app
CMD ["ipython"]
