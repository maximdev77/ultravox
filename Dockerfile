# Ultravox Selfhosted Dockerfile
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y ffmpeg git && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install .

# Expose the server port
EXPOSE 8080

# Start the Ultravox HTTP server
CMD ["python", "ultravox/server.py"]
