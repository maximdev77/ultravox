# Dockerfile für direktes Ausführen von Ultravox (ohne pip install)
FROM python:3.11-slim

# System-Abhängigkeiten
RUN apt-get update && apt-get install -y ffmpeg git && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis
WORKDIR /app

# Projektdateien kopieren
COPY . .

# Python-Abhängigkeiten installieren
RUN pip install --upgrade pip && pip install -r requirements.txt

# Port freigeben
EXPOSE 8080

# Startbefehl
CMD ["python", "ultravox/server.py"]
