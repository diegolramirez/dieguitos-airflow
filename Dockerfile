FROM apache/airflow:2.3.0-python3.8

COPY .env /usr/local/airflow/

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    netcat \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER airflow

ENV AIRFLOW_HOME=/opt/airflow

RUN pip install apache-airflow-providers-snowflake

# Initialize the Airflow database
RUN airflow db init

CMD ["webserver"]
