#!/bin/bash

airflow users create \
    --username airflow \
    --firstname dieguito \
    --lastname maradona \
    --role Admin \
    --email dieguito@maradona.com \
    --password maradona
