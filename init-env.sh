#!/bin/bash
# Script to initialize .env file from template

if [ -f .env ]; then
    echo ".env file already exists. Skipping creation."
    exit 0
fi

# Copy example to .env
cp env.example .env

# On Linux, set AIRFLOW_UID to current user
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Setting AIRFLOW_UID to $(id -u)"
    sed -i "s/AIRFLOW_UID=.*/AIRFLOW_UID=$(id -u)/" .env
fi

echo ".env file created from env.example"
echo "Please review and update passwords in .env file before starting services."

