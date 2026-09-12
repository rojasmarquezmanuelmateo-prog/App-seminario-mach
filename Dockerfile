FROM python:3.12.14-alpine3.24

WORKDIR /app

# Actualiza las dependencias del sistema operativo
RUN apk upgrade --no-cache

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["sh", "-c", "gunicorn --bind ${APP_HOST:-0.0.0.0}:${APP_PORT:-5000} app:app"]