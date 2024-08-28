#!/bin/bash

# List of directories in the required execution order
dirs=(
    "docker_kafka_weatheralert"      # Kafka app
    #"weather_kstream_app"            # Kafka stream app
    "weather-alert-consumer"         # Consumer app
    "grafana-mongodb-dashboard"      # Grafana app
    "redash-docker"                  # Redash app
)

# Loop through the directories and run docker-compose
for dir in "${dirs[@]}"; do
    echo "Running docker-compose in $dir..."
    cd "$dir" || { echo "Failed to enter directory $dir"; exit 1; }
    sudo docker-compose up -d --build
    cd .. # Go back to the parent directory
    echo "Waiting for 15 seconds before starting the next app..."
    sleep 15
done

echo "All docker-compose instances have been started!"

