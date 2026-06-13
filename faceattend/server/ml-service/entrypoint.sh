#!/bin/bash
set -e

echo "Starting ML Service initialization..."

# Run download_models.py to ensure all models are ready
python3 /app/download_models.py

echo "Starting uvicorn server..."
exec "$@"

