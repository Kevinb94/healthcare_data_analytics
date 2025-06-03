# sqlmesh_engine/Dockerfile

FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app/sqlmesh

# Install OS dependencies
RUN apt-get update && apt-get install -y build-essential curl && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
