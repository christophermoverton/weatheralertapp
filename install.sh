#!/bin/bash

# Array of repositories to clone
repos=(
    "https://github.com/christophermoverton/grafana-mongodb-dashboard.git"
    "https://github.com/christophermoverton/weather-alert-consumer.git"
    "https://github.com/christophermoverton/weather_kstream_app.git"
    "https://github.com/christophermoverton/docker_kafka_weatheralert.git"
    "https://github.com/christophermoverton/redash-docker.git"
)

# Loop through the repos and clone each one
for repo in "${repos[@]}"; do
    echo "Cloning $repo..."
    git clone "$repo"
done

echo "All repositories have been cloned!"
