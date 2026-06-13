FROM python:3.10-slim

# ✅ Required runtime libs for OpenCV & MediaPipe
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

# ✅ Install precompiled dlib binary first to satisfy the dependency of face_recognition without compiling from source
RUN pip install --no-cache-dir dlib-bin

RUN pip install --no-cache-dir -r requirements.txt


COPY . .

# Make entrypoint script executable
RUN chmod +x /app/entrypoint.sh

EXPOSE 8001

# Use entrypoint to download models at runtime if needed
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8001}"]

