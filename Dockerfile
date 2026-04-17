FROM python:3.11-slim

WORKER /app

COPY main.py .

CMD ["python", "main.py"]
