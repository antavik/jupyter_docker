FROM python:3.10-slim

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
    build-essential \
    apt-utils && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /home/app/

WORKDIR /home/app

RUN pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt

RUN useradd -Us /bin/bash app && \
    chown -R app:app /home/app/

USER app
