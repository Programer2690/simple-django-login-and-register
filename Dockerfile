FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y gcc build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY source ./source
COPY content ./content

RUN mkdir -p /app/content/static
RUN python source/manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "--chdir", "source", "app.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]