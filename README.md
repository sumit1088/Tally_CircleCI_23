# PharmaSeek Microservices

A microservices-based authentication system for the PharmaSeek platform, built using REST APIs.

## Architecture Overview

The system consists of three microservices:

- **API Gateway**: Handles external REST API requests and routes them to appropriate services
- **Auth Service**: Manages user authentication and authorization
- **DB Gateway**: Handles all database operations

## Services

### API Gateway
- Exposes external REST endpoints
- Handles request validation and routing
- Implements authentication middleware
- Port: 8000

### Auth Service
- Manages user authentication (login/signup)
- Handles JWT token generation and validation
- Port: 8001

### DB Gateway
- Manages all database operations
- Implements CRUD operations for Users and Roles
- Port: 8002

## Setup Instructions

1. Clone the repository:
```bash
git clone <repository-url>
cd pharmaseek-microservices
```

2. Create and configure environment variables:
```bash
cp .env.example .env
# Edit .env with your configuration
```

3. Start the services using Docker Compose:
```bash
docker-compose up --build
```

## Development

### Prerequisites
- Python 3.9+
- Docker and Docker Compose
- PostgreSQL 14+

### Local Development
1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run services individually:
```bash
# API Gateway
cd services/api-gateway
uvicorn app.main:app --reload --port 8000

# Auth Service
cd services/auth-service
uvicorn app.main:app --reload --port 8001

# DB Gateway
cd services/db-gateway
uvicorn app.main:app --reload --port 8002
```

## API Documentation

Once the services are running, you can access the API documentation at:
- API Gateway: http://localhost:8000/docs
- Auth Service: http://localhost:8001/docs
- DB Gateway: http://localhost:8002/docs

## Project Structure

```
pharmaseek-microservices/
├── services/
│   ├── api-gateway/
│   │   ├── app/
│   │   │   ├── routes/
│   │   │   ├── models/
│   │   │   ├── middleware/
│   │   │   ├── services/
│   │   │   └── main.py
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   ├── auth-service/
│   │   ├── app/
│   │   │   ├── routes/
│   │   │   ├── models/
│   │   │   ├── services/
│   │   │   └── main.py
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   └── db-gateway/
│       ├── app/
│       │   ├── routes/
│       │   ├── models/
│       │   ├── services/
│       │   ├── db/
│       │   └── main.py
│       ├── Dockerfile
│       └── requirements.txt
├── common/
│   ├── utils/
│   │   ├── exceptions.py
│   │   ├── jwt_utils.py
│   │   └── logging.py
│   ├── __init__.py
│   └── setup.py
├── infrastructure/
│   ├── docker-compose.yml
│   └── scripts/
├── .env.example
└── README.md
```

## Environment Variables

Key environment variables (see .env.example for all variables):

- `POSTGRES_USER`: Database username
- `POSTGRES_PASSWORD`: Database password
- `POSTGRES_DB`: Database name
- `JWT_SECRET`: Secret key for JWT token generation
- `JWT_ALGORITHM`: Algorithm for JWT token generation
- `REDIS_URL`: Redis connection URL (for caching)

## Testing

Run tests for each service:
```bash
cd services/<service-name>
pytest
```

## Contributing

1. Create a feature branch
2. Make your changes
3. Run tests
4. Submit a pull request

## License

[Your License Here] 