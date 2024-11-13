# Hello World in Go

This project is a simple web application in Go that displays "Hello World with Go" when accessed at root.

## Requirements

- Docker installed on the system.

## Usage Instructions

### 1. Build the Docker Image

Navigate to the directory containing `Dockerfile` and `app.go`. Run the following command to build the Docker image:

```bash
docker build -t hello-world-go .
