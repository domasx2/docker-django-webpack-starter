FROM python:3.5

ENV PYTHONUNBUFFERED 1

RUN pip3 install --upgrade pip
RUN pip3 install wheel

VOLUME /app

RUN mkdir static
VOLUME /static

WORKDIR /app
EXPOSE 8000