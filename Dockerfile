FROM python:3.12-alpine

WORKDIR /app

COPY requirements.txt .

RUN apk upgrade --no-cache \
	&& pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["sh", "-c", "gunicorn --bind ${APP_HOST:-0.0.0.0}:${APP_PORT:-5000} app:app"]
