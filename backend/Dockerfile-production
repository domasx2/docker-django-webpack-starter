FROM python:3.5
ENV PYTHONUNBUFFERED 1
RUN pip3 install --upgrade pip
RUN mkdir -p /app
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt

COPY . /app/
EXPOSE 8000
CMD ./bin/start_production.sh