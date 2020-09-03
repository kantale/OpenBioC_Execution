FROM python:3.7-alpine
MAINTAINER Manos Koutoulakis <manos.koutoulak@gmail.com>

# Required dependencies
RUN apk update && apk add bash
RUN apk add --no-cache gcc musl-dev linux-headers

# Client
ENV FLASK_APP client.py
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_ENV development

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN apk add curl
COPY templates/ /code/templates
COPY client.py /code/
COPY REPORTS/ /code/
COPY generated_dags/ /code/



CMD ["flask", "run"]
