FROM apache/airflow:2.3.0-python3.8


USER root

COPY .env /usr/local/airflow/

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

# Create default user
RUN airflow users create \
    --role Admin \
    --username airflow \
    --password maradona \
    --email dieguito@maradona.com \
    --firstname dieguito \
    --lastname maradona

CMD ["webserver"]
