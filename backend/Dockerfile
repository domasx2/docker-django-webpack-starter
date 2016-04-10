FROM python:3.5

ENV PYTHONUNBUFFERED 1

RUN pip3 install --upgrade pip
RUN pip3 install wheel

RUN mkdir -p /app/static /tmp/logs/app

VOLUME /app
VOLUME /static

WORKDIR /app
EXPOSE 8000