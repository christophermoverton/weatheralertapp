
# Weather Alert System with Dockerized Applications

This project sets up a weather alert system using multiple Dockerized applications, including Kafka, a Kafka Stream application, a consumer application, Grafana, and Redash.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Applications](#running-the-applications)
- [Verifying Running Containers](#verifying-running-containers)
- [Shutting Down the Applications](#shutting-down-the-applications)
- [Using Redash with MongoDB](#using-redash-with-mongodb)
- [Directory Structure](#directory-structure)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project consists of several interdependent applications that work together to create a weather alert system. The applications are:

1. **Kafka App**: Handles message brokering.
2. **Kafka Stream App**: Processes the data streams.
3. **Consumer App**: Consumes the data from the stream.
4. **Grafana App**: Provides a dashboard for monitoring.
5. **Redash App**: Allows for querying and visualizing the data.

Each application is containerized using Docker and managed using Docker Compose.

**Note**: This setup is designed for **Linux operating systems**. Ensure that you have a Linux environment to run these scripts.

## Prerequisites

Before you begin, ensure you have the following installed:

- Git
- Docker
- Docker Compose

## Installation

1. **Clone the Repositories**

   Clone all the necessary repositories into the current directory by running the `install.sh` script:

   ```bash
   ./install.sh
   ```

   This will clone the following repositories:

   - [grafana-mongodb-dashboard](https://github.com/christophermoverton/grafana-mongodb-dashboard.git)
   - [weather-alert-consumer](https://github.com/christophermoverton/weather-alert-consumer.git)
   - [weather_kstream_app](https://github.com/christophermoverton/weather_kstream_app.git)
   - [docker_kafka_weatheralert](https://github.com/christophermoverton/docker_kafka_weatheralert.git)
   - [redash-docker](https://github.com/christophermoverton/redash-docker.git)

2. **Make the Scripts Executable**

   Before running the scripts, you need to give them execute permissions. Use the following command to make the `install.sh`, `run.sh`, and `exit.sh` scripts executable:

   ```bash
   chmod +x install.sh run.sh exit.sh
   ```

   This command is essential for Linux environments to ensure the scripts can be executed.

## Running the Applications

To start all the applications in the correct order, use the `run.sh` script:

```bash
./run.sh
```

This script starts the Docker Compose services in the following order:

1. **Kafka App**
2. **Kafka Stream App**
3. **Consumer App**
4. **Grafana App**
5. **Redash App**

## Verifying Running Containers

After running the `run.sh` script, you can verify that the containers are running using the following Docker commands:

1. **List running containers**:

   ```bash
   sudo docker ps
   ```

   This command will display a list of all currently running Docker containers along with details such as container ID, image name, and the command being run.

2. **Inspect the Docker network**:

   ```bash
   sudo docker network ls
   ```

   This command lists all Docker networks that are created. Each application should be connected to a Docker network, which can be verified using:

   ```bash
   sudo docker network inspect <network_name>
   ```

   Replace `<network_name>` with the appropriate network name to see detailed information about the network, including which containers are connected.

## Shutting Down the Applications

To stop all the applications and clean up resources, use the `exit.sh` script:

```bash
./exit.sh
```

This script will navigate to each directory and execute `docker-compose down` to stop the services.

## Using Redash with MongoDB

Once Redash is up and running, you can connect it to your MongoDB database. Here's how you can set up the MongoDB connection in Redash:

1. **Open Redash**: Navigate to your Redash instance in a web browser.

2. **Create a New Data Source**:
   - Go to the "Data Sources" page in Redash.
   - Click on "New Data Source."

3. **Select MongoDB as the Data Source Type**.

4. **Enter the MongoDB Connection String**:
   - Use the following connection string format:
   
     ```
     mongodb://<username>:<password>@<mongo_host>:<mongo_port>/<database_name>?authSource=admin
     ```

   - Replace `<username>`, `<password>`, `<mongo_host>`, `<mongo_port>`, and `<database_name>` with the appropriate values.

     Example:
     
     ```
     mongodb://admin:password@mongo:27017/weather_db?authSource=admin
     ```

     - `mongo`: The hostname of the MongoDB container (if using Docker networking).
     - `27017`: The default MongoDB port.
     - `weather_db`: The name of your MongoDB database.

5. **Save the Data Source**.

   Once saved, you can start creating queries and dashboards in Redash using data from your MongoDB database.

## Directory Structure

After running the installation script, your project structure should look like this:

```
.
├── grafana-mongodb-dashboard/
├── weather-alert-consumer/
├── weather_kstream_app/
├── docker_kafka_weatheralert/
├── redash-docker/
├── install.sh
├── run.sh
└── exit.sh
```

- Each directory corresponds to a different application and contains its own `docker-compose.yml` file and other necessary configurations.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue if you have suggestions or find any bugs.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

