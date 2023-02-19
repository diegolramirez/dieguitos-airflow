#!/bin/bash

# Build the Docker image
docker build -t dieguitos-airflow .

# Start a container with the image
docker run --env-file ./env -p 8080:8080 -v $(pwd)/dags:/usr/local/airflow/dags dieguitos-airflow
