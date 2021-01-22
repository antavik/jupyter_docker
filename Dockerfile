FROM python:3.9.1-slim

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
    gcc \
    apt-utils && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

COPY ./pipfiles/ /home/app/

WORKDIR /home/app

RUN pip install --no-cache-dir pipenv==2020.8.13  && \
    pipenv install --system --ignore-pipfile

RUN useradd -Us /bin/bash app && \
    chown -R app:app /home/app/

USER app