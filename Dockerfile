# Stage 1: Build - install dependencies
FROM python:3.10-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --prefix=/install -r requirements.txt

COPY app.py .

# Stage 2: Runtime - copy dependencies and app
FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /install /usr/local
COPY --from=builder /app/app.py .

CMD ["python", "app.py"]
