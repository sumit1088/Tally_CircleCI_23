FROM python:3.11-slim

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

COPY ./app /app/app

HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=3 \
  CMD curl --fail http://localhost:8000/health || exit 1

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
