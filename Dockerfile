# Development stage
FROM python:3.11-slim as development

WORKDIR /app
ENV PYTHONPATH=/app

RUN apt-get update && apt-get install -y \
    gcc \
    postgresql-client \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN python -m spacy download en_core_web_sm

# ✅ Fix here: copy everything inside ./app to /app
COPY ./app /app

# Optional env
# COPY .env .env

HEALTHCHECK CMD curl --fail http://localhost:8000/health || exit 1

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

