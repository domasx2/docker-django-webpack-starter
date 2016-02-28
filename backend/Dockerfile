FROM python:3.5

ENV PYTHONUNBUFFERED 1

ADD requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt --src /usr/local/src

RUN mkdir static
VOLUME ["/static"]

WORKDIR /src
EXPOSE 8000
ENTRYPOINT ["python3", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]