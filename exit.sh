#!/bin/bash

# List of directories corresponding to the cloned repos
dirs=(
    "grafana-mongodb-dashboard"
    "weather-alert-consumer"
    "weather_kstream_app"
    "docker_kafka_weatheralert"
    "redash-docker"
)

# Loop through the directories and shut down docker-compose
for dir in "${dirs[@]}"; do
    echo "Shutting down docker-compose in $dir..."
    cd "$dir" || { echo "Failed to enter directory $dir"; exit 1; }
    sudo docker-compose down
    cd .. # Go back to the parent directory
done

echo "All docker-compose instances have been stopped!"
