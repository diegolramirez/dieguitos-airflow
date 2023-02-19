from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator


def print_hello():
    print("Hello, World!")


with DAG(
    dag_id="hello_world",
    start_date=datetime(2021, 1, 1),
    catchup=False,
    dagrun_timeout=timedelta(minutes=60),
    tags=["hello"],
) as dag:
    start = DummyOperator(task_id="start")
    hello_world = PythonOperator(
        task_id="print_hello", python_callable=print_hello, dag=dag
    )
    finish = DummyOperator(task_id="finish")

    start >> hello_world >> finish
