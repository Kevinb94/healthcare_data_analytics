# ./synthea/Dockerfile
FROM openjdk:17-slim

# Install git and build tools
RUN apt-get update && \
    apt-get install -y git gradle && \
    rm -rf /var/lib/apt/lists/*

# Clone and build synthea
WORKDIR /app

RUN git clone https://github.com/synthetichealth/synthea.git && \
    cd synthea && \
    ./gradlew build check test

# Set working directory inside synthea
WORKDIR /app/synthea

# Default command to generate 10 patients in Massachusetts
# CMD ["./run_synthea", "Massachusetts", "-p", "10"]
CMD ["sleep", "infinity"]
