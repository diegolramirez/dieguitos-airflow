from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "start_date": datetime(2023, 2, 20),
    "email": ["airflow@example.com"],
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

dag = DAG("hello_world", default_args=default_args, schedule_interval=timedelta(days=1))


def print_hello():
    print("Hello, World!")


with dag:
    start = DummyOperator(task_id="start")
    hello_world = PythonOperator(
        task_id="print_hello", python_callable=print_hello, dag=dag
    )
    finish = DummyOperator(task_id="finish")

    start >> hello_world >> finish
