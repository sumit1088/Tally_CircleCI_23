docker compose -f infrastructure/docker-compose.dev.yml build db-gateway && docker compose -f infrastructure/docker-compose.dev.yml up -d db db-gateway


python3 -m venv ps-env
source ps-env/bin/activate

pip install openai

export OPENAI_API_KEY="<paste key here>"