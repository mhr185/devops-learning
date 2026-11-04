FROM python:3.11-alpine AS build

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000
CMD ["python", "app.py"]