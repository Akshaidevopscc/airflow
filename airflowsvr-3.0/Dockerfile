FROM apache/airflow:3.1.3

# Install FAB provider as airflow user with Airflow constraints
USER airflow
ARG AIRFLOW_VERSION=3.1.3
ARG PYTHON_VERSION=3.12
RUN pip install --no-cache-dir --user "apache-airflow-providers-fab" \
    --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"