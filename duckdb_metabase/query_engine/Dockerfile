FROM python:3.11-slim

# Optional: install system tools like curl, nano
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl nano && \
    rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /workspace
CMD ["ipython"]
