# Metabase Bootstrap

This folder contains a small Python service that automatically sets up Metabase when the project is first started.

## What It Does

- Waits for Metabase to become available
- Logs into the Metabase API
- Creates default collections (folders) for organizing dashboards
- You can expand it to also create dashboards, questions, and models

## Why This Exists

Metabase doesn't let you define dashboards or questions in code by default.  
This script helps keep your setup consistent every time the project runs.

## How It Works

1. This runs as a container using Docker Compose.
2. It connects to Metabase on startup.
3. It uses the Metabase REST API to set things up.


