#!/bin/sh
FILE=./.env
if [ -f "$FILE" ]; then
    echo "production"
    docker-compose -f docker-compose.yaml down 
    docker-compose -f docker-compose.yaml up --build -d 
else
    echo "development"
    docker-compose -f docker-compose.yaml down 
    docker-compose -f docker-compose.yaml up --build -d
fi
