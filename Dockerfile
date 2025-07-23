# Development stage
FROM python:3.11-slim as development

# Set working directory
WORKDIR /app

# Set PYTHONPATH so "app" can be imported from anywhere
ENV PYTHONPATH=/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    postgresql-client \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Download spaCy English model
RUN python -m spacy download en_core_web_sm

# Copy only the relevant app directory into /app/app (avoid double nesting)
COPY ./app /app/app
COPY ./app/db/init-multiple-db.sql /app/app/db/init-multiple-db.sql
COPY .env .env  # Optional: If you use an env file

# Add healthcheck for Docker awareness
HEALTHCHECK CMD curl --fail http://localhost:8000/health || exit 1

# Default command
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
