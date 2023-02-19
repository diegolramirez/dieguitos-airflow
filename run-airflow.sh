#!/bin/bash

# set -a
# [ -f .env ] && . .env
# set +a

source .env

# Build the Docker image
docker build -t dieguitos-airflow .

# Start a container with the image
docker run -p 8080:8080 -v $(pwd)/dags:/opt/airflow/dags -v $(pwd)/logs:/opt/airflow/logs dieguitos-airflow
