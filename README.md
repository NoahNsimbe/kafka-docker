# Docker image for kafka

Prebuilt image can be found at ``` noahnsimbe/kafka-docker ```

## Prerequisites

- Docker or Docker compose

### Using Docker

```bash
docker build --target=docker-image -t my-kafka-image . 
docker run  -p 9092:9092 my-kafka-image
```

### Using Docker compose

#### Start containers

```bash
sh run.sh  
```

#### Stop containers

```bash
Ctrl + c
```

#### Cleanup

```bash
sh cleanup.sh  
```
