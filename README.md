# Learn Faust and Kafka

## How to run?

1. Kafka docker and faust workstation
    ```bash
    docker compose up
    faust -A faust_learning.main worker -l info
    ```
2. Kafka with faust application in docker
    ```bash
    docker compose --profile faust-docker up --build
    ```
