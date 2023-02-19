#!/bin/bash

# Build the Docker image
docker build -t dieguitos-airflow .

# Start a container with the image
docker run --env-file ./.env -p 8080:8080 \
    -v "/$(pwd)/dags:/opt/airflow/dags" \
    -v "/$(pwd)/logs:/opt/airflow/logs" \
    -v "/$(pwd)/plugins:/opt/airflow/plugins" \
    dieguitos-airflow
