FROM apache/airflow:3.1.3

# Install FAB provider as airflow user (per Airflow docker-stack guidance)
USER airflow
RUN pip install --no-cache-dir --user apache-airflow-providers-fab