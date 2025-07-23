# PharmaSeek DB Gateway Service

This service provides a RESTful API for managing users, roles, and authentication in the PharmaSeek microservices architecture.

## Features

- User management (CRUD operations)
- Role-based access control
- JWT-based authentication
- PostgreSQL database integration
- FastAPI framework
- SQLAlchemy ORM
- Alembic migrations

## Prerequisites

- Python 3.9+
- PostgreSQL 12+
- Docker and Docker Compose (for containerized deployment)

## Setup

1. Clone the repository:
```bash
git clone https://github.com/yourusername/pharmaseek-microservices.git
cd pharmaseek-microservices/services/db-gateway
```

2. Create and activate a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Create a `.env` file:
```bash
cp .env.example .env
```
Edit the `.env` file with your configuration.

5. Initialize the database:
```bash
alembic upgrade head
```

## Running the Service

### Development

```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

### Production (Docker)

```bash
docker build -t pharmaseek/db-gateway .
docker run -p 8000:8000 --env-file .env pharmaseek/db-gateway
```

## API Documentation

Once the service is running, you can access:
- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## API Endpoints

### Authentication
- `POST /api/v1/auth/login` - Login and get access token
- `POST /api/v1/auth/register` - Register new user
- `POST /api/v1/auth/test-token` - Test access token

### Users
- `GET /api/v1/users/` - List users
- `POST /api/v1/users/` - Create user
- `GET /api/v1/users/{user_id}` - Get user by ID
- `PUT /api/v1/users/{user_id}` - Update user
- `DELETE /api/v1/users/{user_id}` - Delete user

### Roles
- `GET /api/v1/users/roles/` - List roles
- `POST /api/v1/users/roles/` - Create role
- `GET /api/v1/users/roles/{role_id}` - Get role by ID
- `PUT /api/v1/users/roles/{role_id}` - Update role
- `DELETE /api/v1/users/roles/{role_id}` - Delete role

### User-Role Management
- `POST /api/v1/users/{user_id}/roles/` - Assign role to user
- `DELETE /api/v1/users/{user_id}/roles/{role_id}` - Remove role from user
- `GET /api/v1/users/{user_id}/roles/` - Get user's roles

## Database Migrations

To create a new migration:
```bash
alembic revision --autogenerate -m "description of changes"
```

To apply migrations:
```bash
alembic upgrade head
```

## Testing

```bash
pytest
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 