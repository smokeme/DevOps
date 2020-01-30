FROM python:3.7.4-alpine3.10
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base linux-headers 
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
COPY requirements.txt /app/
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app/
ENTRYPOINT ["/app/data/entrypoint.sh"]
EXPOSE 8000