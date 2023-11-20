FROM python:3.8-slim-buster
COPY tasks.py /app/tasks.py

RUN apt-get update && apt-get -y install python3-dev gcc
# We will use internal functions of the API
# So install all dependencies of the API
RUN cd app
RUN pip install celery

WORKDIR /app

ENTRYPOINT celery -A tasks worker --loglevel=INFO