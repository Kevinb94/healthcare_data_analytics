FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Optional: install curl or jq if needed
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
